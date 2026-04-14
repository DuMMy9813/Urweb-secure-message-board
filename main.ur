table messages : { Id : int, Username : string, Content : string }
  PRIMARY KEY Id

sequence msgSeq

(* Server-side: add a validated message *)
fun addMessage (user : string) (msg : string) : transaction unit =
    if user = "" || msg = "" then
        error <xml>Username and message must not be empty.</xml>
    else if strlen user > 50 then
        error <xml>Username must be 50 characters or fewer.</xml>
    else if strlen msg > 500 then
        error <xml>Message must be 500 characters or fewer.</xml>
    else
        id <- nextval msgSeq;
        dml (INSERT INTO messages (Id, Username, Content)
             VALUES ({[id]}, {[user]}, {[msg]}));
        return ()

(* Server-side: fetch all messages as XML *)
fun listMessages () : transaction xbody =
    rows <- queryX (SELECT * FROM messages ORDER BY messages.Id DESC)
        (fn r =>
            <xml>
                <li>
                    <b>{[r.Messages.Username]}</b>: {[r.Messages.Content]}
                </li>
            </xml>);
    return <xml><ul>{rows}</ul></xml>

(* Main page *)
fun main () : transaction page =
    msgs <- source <xml/>;
    let
        fun refresh () =
            m <- rpc (listMessages ());
            set msgs m
    in
        return <xml>
            <head>
                <title>Secure Message Board</title>
                <style>
                    body {{ font-family: sans-serif; max-width: 700px;
                            margin: 40px auto; padding: 0 20px; }}
                    input, textarea {{ width: 100%; margin-bottom: 10px;
                                       padding: 8px; box-sizing: border-box; }}
                    button {{ padding: 10px 20px; background: #2c7be5;
                              color: white; border: none; cursor: pointer; }}
                </style>
            </head>
            <body onload={refresh ()}>
                <h1>Secure Message Board</h1>
                <p>Post a message below. All input is handled securely by Ur/Web.</p>

                <h2>Post a Message</h2>
                <textbox{#user} placeholder="Username (max 50 chars)"/>
                <textarea{#msg} placeholder="Message (max 500 chars)"/>
                <button value="Post Message"
                    onclick={fn _ =>
                        u <- get user;
                        m <- get msg;
                        rpc (addMessage u m);
                        refresh ()
                    }/>

                <h2>All Messages</h2>
                <dyn signal={signal msgs}/>
            </body>
        </xml>
    end