-- UBB - INFO - MATE-INFO-RO
call profile_insert(@faculty_id, 'Matematică-Informatică', 'Matematică-Informatică - Ro', 'Română', 'Licență', 2, @profile_id);
-- UBB - INFO - MATE-INFO-RO - An 1
call year_insert(@profile_id, 'Anul 1', 2, @year_id);
call course_insert(@year_id, 'Algebră 1 (Algebră liniară)', 'Algebră 1', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Logică matematică', 'Logică matematică', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Analiză matematică 1 (Analiza pe R)', 'Analiză 1', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Geometrie 1 (Geometrie analitică)', 'Geometrie 1', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Fundamentele programării', 'FP', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);	
call course_insert(@year_id, 'Matematică de bază', 'Matematică de bază', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Comunicare şi dezvoltare profesională în informatică', 'CDPI', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Limba engleză', 'Engleză', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Limba franceză', 'Franceză', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Limba germană', 'Germană', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Algebră 2 (Structuri algebrice de bază)', 'Algebră 2', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Analiză matematică 2 (Calcul diferenţial în R^n)', 'Analiză 2', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Geometrie 2 (Geometrie afină)', 'Geometrie 2', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Ecuaţii diferenţiale', 'Ecuaţii diferenţiale', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
 	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Programare orientată obiect', 'POO', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Structuri de date şi algoritmi', 'SDA', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Metode avansate de rezolvare a problemelor de matematică şi informatică', 'MARPMI', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
call course_insert(@year_id, 'Limba engleză', 'Engleză', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Limba franceză', 'Franceză', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Limba germană', 'Germană', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
-- UBB - INFO - MATE-INFO-RO - An 2
call year_insert(@profile_id, 'Anul 2', 2, @year_id);
call course_insert(@year_id, 'Metode avansate de programare', 'MAP', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Analiză matematică 3 (Calcul integral în R^n)', 'Analiză 3', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Geometrie 3 (Geometria diferenţială a curbelor şi suprafeţelor)', 'Geometrie 3', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Analiză complexă', 'Analiză complexă', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Baze de date', 'BD', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Arhitectura sistemelor de calcul', 'ASC', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Funcţii reale', 'Funcţii reale', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Analiză numerică', 'Analiză numerică', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Mecanică teoretică', 'Mecanică teoretică', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Probabilităţi', 'Probabilităţi', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Sisteme de operare', 'SO', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Complemente de algebră', 'Complemente de algebră', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Complemente de analiză matematică', 'Complemente de analiză matematică', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Funcţii convexe', 'Funcţii convexe', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Grafuri şi combinatorică', 'Grafuri şi combinatorică', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
-- UBB - INFO - MATE-INFO-RO - An 3
call year_insert(@profile_id, 'Anul 3', 2, @year_id);
call course_insert(@year_id, 'Statistică matematică', 'Statistică matematică', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Limbaje formale şi tehnici de compilare', 'Limbaje formale şi tehnici de compilare', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Teoria numerelor', 'Teoria numerelor', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Ecuaţii cu derivate parţiale', 'Ecuaţii cu derivate parţiale', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Redactarea documentelor matematice în LaTeX', 'RDM în Latex', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Capitole speciale de ecuaţii diferenţiale ordinare', 'CSEDO', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Software matematic', 'Software matematic', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Astronomie', 'Astronomie', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Analiză funcţională', 'Analiză funcţională', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Programare distribuită - platforme Java', 'PDPJ', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Instrumente CASE', 'Instrumente CASE', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Date semistructurate', 'Date semistructurate', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Tehnici pentru regăsirea informaţiei', 'TRI', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Tehnici de optimizare', 'Tehnici de optimizare', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Ingineria sistemelor soft', 'ISS', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Inteligenţă artificială', 'IA', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Reţele de calculatoare', 'Reţele', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Proiect colectiv', 'Proiect colectiv', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);	
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@year_id, 'Istoria matematicii', 'Istoria matematicii', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
call course_insert(@year_id, 'Istoria informaticii', 'Istoria informaticii', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
call course_insert(@year_id, 'Metodologia documentării şi elaborării unei lucrări ştiinţifice', 'MDELS', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);