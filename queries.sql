-- ═══════════════════════════════════════════════
--  Praxis 01 – SQL-Aufgaben
-- ═══════════════════════════════════════════════

-- ── Aufgabe 1: Alle Schüler anzeigen ─────────────
-- Lest alle Spalten und Zeilen aus der Tabelle Schueler.
SELECT *
FROM   Schueler;


-- ── Aufgabe 2: Nachnamen alphabetisch sortiert ───
-- Nur Nachname und Vorname, aufsteigend nach Nachname sortiert.
SELECT Nachname, Vorname
FROM   Schueler
ORDER BY Nachname ASC;


-- ── Aufgabe 3: Nur Schüler der Klasse 3CHIF ─────
-- Filtert so, dass nur Schüler aus 3CHIF angezeigt werden.
SELECT Vorname, Nachname, Klasse
FROM   Schueler
WHERE  Klasse = '3CHIF';


-- ── Aufgabe 4: Wie viele Schüler gibt es? ────────
-- Gesamtanzahl der Schüler zählen, mit sinnvollem Alias.
SELECT COUNT(*) AS Anzahl_Schueler
FROM   Schueler;


-- ── Aufgabe 5: Alle Noten mit Schüler- und Fachnamen (JOIN) ──
-- Verbindet Schueler, Note und Fach –
-- zeigt Vorname, Nachname, Fach-Kürzel und Note.
SELECT s.Vorname,
       s.Nachname,
       f.Kuerzel  AS Fach,
       n.Wert     AS Note
FROM   Schueler s
  JOIN Note    n ON s.SchuelerID = n.SchuelerID
  JOIN Fach    f ON n.FachID     = f.FachID
ORDER BY s.Nachname, f.Kuerzel;


-- ── Aufgabe ★ (Bonus): Beste Note je Fach ────────
-- Ermittelt je Fach die beste Note (= niedrigste Zahl).
-- Sortiert alphabetisch.
SELECT f.Name        AS Fach,
       MIN(n.Wert)   AS Beste_Note
FROM   Note n
  JOIN Fach f ON n.FachID = f.FachID
GROUP BY f.Name
ORDER BY f.Name;
