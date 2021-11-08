(define (problem p1)
	(:domain podroznik-planet)
	(:objects
	    pole1 pole2 pole3 pole4 pole5 pole6 a b c d e
	    p1 p2 p3 p4 p5 p6 p7 p8
	    d1 d2 d3 d4 d5 d6 d7
	)
	(:init
        (l-somsiady pole1 pole2)
        (l-somsiady pole1 pole3)
        (l-somsiady pole1 pole4)
        (l-somsiady pole2 pole1)
        (l-somsiady pole2 pole3)
        (l-somsiady pole2 pole5)
        (l-somsiady pole3 pole1)
        (l-somsiady pole3 pole2)
        (l-somsiady pole3 pole4)
        (l-somsiady pole3 pole5)
        (l-somsiady pole3 pole6)
        (l-somsiady pole4 pole1)
        (l-somsiady pole4 pole3)
        (l-somsiady pole4 pole6)
        (l-somsiady pole5 pole2)
        (l-somsiady pole5 pole3)
        (l-somsiady pole5 pole6)
        (l-somsiady pole6 pole3)
        (l-somsiady pole6 pole4)
        (l-somsiady pole6 pole5)
        
        (l-na pole1 d)
        (l-na pole3 c)
        (l-na pole4 e)
        (l-na pole5 b)
        (l-na pole6 a)
        
        (teleport p1 p2 d1)
        (teleport p1 p6 d5)
        (teleport p2 p1 d1)
        (teleport p3 p4 d3)
        (teleport p3 p5 d4)
        (teleport p4 p3 d3)
        (teleport p4 p8 d7)
        (teleport p5 p3 d4)
        (teleport p6 p1 d5)
        (teleport p6 p7 d6)
        (teleport p7 p6 d6)
        (teleport p8 p4 d7)
        
        (somsiady p2 p3)
        (somsiady p3 p2)
        (somsiady p4 p5)
        (somsiady p5 p4)
        
        (ludzik p1)
        (centrum-sterowania-gwiazdozbiorami p6)
        
        (dzwignia-na d1 p1)
        (dzwignia-na d1 p8)
        (dzwignia-na d3 p2)
        (dzwignia-na d4 p4)
        (dzwignia-na d5 p5)
        (dzwignia-na d6 p6)
        (dzwignia-na d7 p5)
        (dzwignia-na d7 p8)
        
        
        ; W celu uproszczenia problemu wprowadzamy dodatkową planetę P8 i przenosimy na nią zieloną dźwignię D1.
        ; Planeta P8 jest połączona wyłącznie z planetą P4 i łączy je teleport D7.
        ; Planeta P8, poza zieloną dźwignią D1, posiada także dźwignię D7 umożliwiającą powrót na planetę P4
        ; Przycisk będący na planecie P5 zostaje zamieniony na dźwignię D7
        ; Powyższy zabieg ma na celu uproszczenie problemu poprzez zlikwidowanie konieczności obsługi przycisku i bariery
	)
	(:goal
		(and
            (l-na pole1 a)
            (l-na pole2 e)
            (l-na pole4 b)
            (l-na pole5 d)
            (l-na pole6 c)
            
            (ludzik p7)
		)
	)
)