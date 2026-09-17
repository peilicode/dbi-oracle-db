-- ═══════════════════════════════════
--  Beispieldatenbank
--  Szenario: Schüler & Noten
-- ═══════════════════════════════════

CREATE TABLE Schueler (
    SchuelerID  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Vorname     VARCHAR2(50)  NOT NULL,
    Nachname    VARCHAR2(50)  NOT NULL,
    Klasse      VARCHAR2(10)  NOT NULL,
    GebDatum    DATE
);

CREATE TABLE Fach (
    FachID   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Kuerzel  VARCHAR2(10)  NOT NULL,
    Name     VARCHAR2(100) NOT NULL
);

CREATE TABLE Note (
    NoteID     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    SchuelerID NUMBER NOT NULL REFERENCES Schueler(SchuelerID),
    FachID     NUMBER NOT NULL REFERENCES Fach(FachID),
    Wert       NUMBER(2,1)  NOT NULL CHECK (Wert BETWEEN 1 AND 5),
    Datum      DATE DEFAULT SYSDATE NOT NULL
);

INSERT INTO Fach (Kuerzel, Name) VALUES ('DBI', 'Datenbanken');
INSERT INTO Fach (Kuerzel, Name) VALUES ('POS', 'Programmieren');
INSERT INTO Fach (Kuerzel, Name) VALUES ('AM',  'Angewandte Mathematik');
INSERT INTO Fach (Kuerzel, Name) VALUES ('E',   'Englisch');

INSERT INTO Schueler (Vorname, Nachname, Klasse, GebDatum)
  VALUES ('Anna',   'Müller',    '3CHIF', DATE '2010-03-15');
INSERT INTO Schueler (Vorname, Nachname, Klasse, GebDatum)
  VALUES ('Lukas',  'Schneider', '3CHIF', DATE '2010-07-22');
INSERT INTO Schueler (Vorname, Nachname, Klasse, GebDatum)
  VALUES ('Sophie', 'Wagner',    '3CHIF', DATE '2010-11-08');
INSERT INTO Schueler (Vorname, Nachname, Klasse, GebDatum)
  VALUES ('Max',    'Bauer',     '3CHIF', DATE '2011-01-30');
INSERT INTO Schueler (Vorname, Nachname, Klasse, GebDatum)
  VALUES ('Julia',  'Fischer',   '3DHIF', DATE '2010-05-19');
INSERT INTO Schueler (Vorname, Nachname, Klasse, GebDatum)
  VALUES ('Tim',    'Weber',     '3DHIF', DATE '2010-09-03');

INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (1, 1, 1, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (1, 2, 2, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (2, 1, 3, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (2, 2, 2, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (3, 1, 1, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (3, 3, 4, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (4, 1, 2, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (4, 4, 3, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (5, 1, 5, DATE '2026-09-05');
INSERT INTO Note (SchuelerID, FachID, Wert, Datum)
  VALUES (6, 2, 1, DATE '2026-09-05');

COMMIT;
