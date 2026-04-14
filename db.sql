
CREATE TABLE uw_messages (
    uw_Id INT PRIMARY KEY,
    uw_Username TEXT NOT NULL,
    uw_Content TEXT NOT NULL
);

CREATE SEQUENCE uw_msgSeq;
