
table messages : { Id : int, Username : string, Content : string }
  PRIMARY KEY Id

sequence msgSeq

(* Add a new message *)
fun addMessage (user : string, msg : string) : transaction unit =
    id <- nextval msgSeq;
    dml (INSERT INTO messages (Id, Username, Content)
         VALUES ({[id]}, {[user]}, {[msg]}));
    return ()

(* Display all messages *)
fun listMessages () : transaction xbody =
    rows <- queryX (SELECT * FROM messages)
        (fn r =>
            <xml>
                <li>
                    <b>{[r.Username]}</b>: {[r.Content]}
                </li>
            </xml>);
    return <xml><ul>{rows}</ul></xml>

(* Main page *)
fun main () : transaction page =
    msgs <- listMessages ();

    return <xml>
        <head>
            <title>Secure Message Board</title>
        </head>
        <body>
            <h1>Secure Message Board</h1>

            <form>
                <p>Username:</p>
                <textbox{#user}/>

                <p>Message:</p>
                <textbox{#msg}/>

                <br/><br/>

                <button value="Post"
                    onclick={fn _ =>
                        u <- get user;
                        m <- get msg;
                        rpc (addMessage u m);
                        return ()
                    }/>
            </form>

            <h2>Messages</h2>
            {msgs}
        </body>
    </xml>

