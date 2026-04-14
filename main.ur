
table messages : { Id : int, Content : string }
  PRIMARY KEY Id

sequence msgSeq

(* Add a new message *)
fun addMessage (msg : string) : transaction unit =
    id <- nextval msgSeq;
    dml (INSERT INTO messages (Id, Content)
         VALUES ({[id]}, {[msg]}));
    return ()

(* Display all messages *)
fun listMessages () : transaction xbody =
    rows <- queryX (SELECT * FROM messages)
        (fn r =>
            <xml>
                <li>{[r.Content]}</li>
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
            <h1>Message Board</h1>

            <form>
                <textbox{#msg}/>
                <button value="Post"
                    onclick={fn _ =>
                        m <- get msg;
                        rpc (addMessage m);
                        return ()
                    }/>
            </form>

            <h2>Messages</h2>
            {msgs}
        </body>
    </xml>
