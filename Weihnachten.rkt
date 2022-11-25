;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Weihnachten) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Weihnachtsanimation


; Konstanten

(define single-flake
  (circle 2 "solid" "white"))

(define scenery-width 500)
(define scenery-height 400)

(define horizontal-offset 4)
(define falling-speed 3)
(define falling-distance scenery-height)

(define background
  (put-pinhole
   100
   0
   (rectangle scenery-width scenery-height "solid" "light gray")))


; defiert eine Position auf der Leinwand
(: position (integer integer -> position))
(: position-x (position -> integer))
(: position-y (position -> integer))



; definiert einen Record für Schneeflocken. Enthält:
; - snowflake-image
; - snowflake-position
; - snowflake-horizontal-offset
; - snowflake-falling-speed
(: make-snowflake (image integer integer -> snowflake))
(: snowflake-image (snowflake -> image))
(: snowflake-snowflake-position (snowflake -> position))
(: snowflake-horizontal-offset (snowflake -> integer))
(: snowflake-falling-speed (snowflake -> integer))

(define-record snowflake
  make-snowflake
  snowflake?
  (snowflake-image             image)
  (snowflake-position          position )
  (snowflake-horizontal-offset integer)
  (snowflake-falling-speed     integer))


; kombiniert alle Teilbilder in einer Weihnachtsszene
(: christmas (integer -> image))
(define christmas
  (lambda (time)
    (clear-pinhole
     (overlay/pinhole
      (snowfall my-snowflake time) ;Diese Zeile beliebige Male mit my-snowflake 1, 2, 3, ... wiederholen
      background))))


; zeichnet den Schneefall zum Zeitpunkt t
(: snowfall (snowflake integer -> image))
(define snowfall
  (lambda (snowflake time)
    (put-pinhole
     (snowflake-horizontal snowflake time)
     (snowflake-vertical   snowflake time)
     (snowflake-image snowflake)
     ;(snowflake-rotation   time)
     )))


; die Schneeflocke soll leicht hin- und herschwingen
(: snowflake-horizontal (snowflake integer -> number))
(define snowflake-horizontal
  (lambda (snowflake time)
    (round (* (snowflake-horizontal-offset snowflake) (sin time)))))

; die Schneeflocke fällt mit einer bestimmten Geschwindigkeit
(: snowflake-vertical (snowflake integer -> number))
(define snowflake-vertical
  (lambda (snowflake time)
    (- (modulo (* (snowflake-falling-speed snowflake) time) falling-distance))))


; Die Schneeflock



; Testfälle

(define my-snowflake
  (make-snowflake single-flake horizontal-offset falling-speed))
























































