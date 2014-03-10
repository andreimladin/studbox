-- UTCLUJ - Calculatoare - Calculatoare-EN
call profile_insert(@faculty_id, 'Calculatoare', 'Calculatoare - En', 'Engleză', 'Licență', 2, @profile_id);
-- UTCLUJ - Calculatoare - Calculatoare-EN - An1
call course_insert(@profile_id, 'Analiză matematică 1 (Calcul diferențial)', 'Analiză 1', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Algebră liniară și geometrie analitică', 'ALGA', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Matematici Speciale', 'Matematici Speciale', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Analiza și sinteza dispozitivelor numerice', 'ASDN', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Programarea calculatoarelor', 'PC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Fizică', 'Fizică', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Limba engleză 1', 'Engleză 1', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Analiză Matematică 2 (Calcul integral și ecuații diferențiale)', 'Analiză 2', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Matematici speciale în inginerie', 'MSI', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Electrotehnică', 'Electrotehnică', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Proiectarea sistemelor numerice', 'PSN', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Structuri de date și algoritmi', 'SDA', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Bazele circuitelor electronice', 'BCE', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Chimie', 'Chimie', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Limba engleză 2', 'Engleză 2', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
-- UTCLUJ - Calculatoare - Calculatoare-EN - An 2
call course_insert(@profile_id, 'Măsuri electronice și senzori', 'MES', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Calcul numeric', 'Calcul numeric', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Circuite analogice și numerice', 'CAN', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Programare orientată pe obiect', 'POO', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Baze de date', 'BD', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Programare în limbaj de asamblare', 'PLA', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Limba engleză (redactare documente tehnice) - 1', 'Engleză', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Teoria sistemelor', 'Teoria sistemelor', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Arhitectura calculatoarelor', 'AC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Algoritmi fundamentali', 'AF', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Tehnici de programare fundamentale', 'TPF', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme de operare', 'SO', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Elemente de grafică asistată de calculator', 'EGAC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Elemente de mecanică', 'Elemente de mecanică', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Limba engleză (redactare documente tehnice) - 2', 'Engleză', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
-- UTCLUJ - Calculatoare - Calculatoare-EN - An 3
call course_insert(@profile_id, 'Proiectare cu microprocesoare', 'PM', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Programare logică', 'Programare logică', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@profile_id, 'Programare functională', 'Programare functională', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Inginerie software', 'Inginerie software', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Introducere în inteligență artificială', 'Introducere în inteligență artificială', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Legislație economică', 'Legislație economică', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme de prelucrare grafică', 'Sisteme de prelucrare grafică', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Structura sistemelor de calcul', 'SSC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Limbaje formale și translatoare', 'LFT', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Management și comunicare', 'MC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
call course_insert(@profile_id, 'Procesarea imaginilor', 'Procesarea imaginilor', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Proiectare software', 'Proiectare software', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme inteligente', 'Sisteme inteligente', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme de conducere a roboților', 'SCR', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Semnale și sisteme', 'SC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme de timp real', 'SCR', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
-- UTCLUJ - Calculatoare - Calculatoare-EN - An 4
call course_insert(@profile_id, 'Rețele de calculatoare', 'Rețele', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme distribuite', 'SD', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme de intrare ieșire si echipamente periferice', 'SIIEP', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Calcul paralel și distribuit ', 'CPD', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Proiectarea sistemelor de operare', 'PSO', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Proiectare interfețe utilizator', 'PIU', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme de recunoaștere a formelor', 'SRF', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Proiectarea translatoarelor', 'PT', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Marketing', 'Marketing', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
call course_insert(@profile_id, 'Cultură și civilizație europeană', 'CCE', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme informatice', 'Sisteme informatice', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Managementul proiectelor', 'Managementul proiectelor', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
call course_insert(@profile_id, 'Metodologia întocmirii proiectelor', 'MIP', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
call course_insert(@profile_id, 'Proiect protocoale si retele de comunicatii', 'PPRC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@profile_id, 'Sisteme bazate pe cunostinte', 'SBC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Programare paralelă', 'Programare paralelă', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Proiectarea bazelor de date', 'PBD', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@profile_id, 'Proiectarea rețelelor de calculatoare', 'PRC', 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);