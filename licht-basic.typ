#import "test.typ": test

#show: test.with(
  subject: [Licht],
  qualification: [Basic],
  section: [Praxis],
  pass-requirements: [Maximal 2 Fehler.],
  questions: (
    [= Einschalten und Ausrichten des mittleren Moving Heads hin zu der Mitte der Bühne],
    [Korrekte Sicherungen eingeschaltet],
    [Lichtendstufen angeschaltet],
    [Licht-PC gestartet],
    [DMX Joker gestartet],
    [Korrekten Moving Head ausgewählt],
    [Lampe des Moving Heads eingeschaltet (weder Shutter noch Dimmer)],
    [Shutter des Moving Head geöffnet],
    [Dimmer des Moving Head angeschaltet],
    [Scheinwerferschalter links neben dem Licht-PC eingeschaltet],
    [Moving Head positioniert],
    
    [= Manueller Theaterscheinwerfer],
    [Stromstecker reingesteckt],
    [Schalter aktiviert],
    [Scheinwerfer ausgerichtet],
    [Mögliche heiß werdende Teile nach Frage richtig identifiziert],
  ),
)

// vim: ft=rust ts=2 sw=2 et
