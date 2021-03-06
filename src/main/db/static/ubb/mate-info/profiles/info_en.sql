-- UBB - INFO - INFO-EN
call profile_insert(@faculty_id, 'Informatică', 'Informatică - En', 'Engleză', 'Licenţă', 2, @profile_id);
-- UBB - INFO - INFO-EN - An 1
call year_insert(@profile_id, 'Anul 1', 2, @year_id);
call course_insert(@year_id, 'Arhitectura sistemelor de calcul', 'ASC', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Fundamentele programării', 'FP', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Logică computaţională', 'LC', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Comunicare şi dezvoltare profesională în informatică', 'CDPI', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Algebră', 'Algebră', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Analiză matematică', 'Analiză', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Limba engleză', 'Engleză', 1, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Sisteme de operare', 'SO', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
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
call course_insert(@year_id, 'Geometrie', 'Geometrie', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Sisteme dinamice', 'SD', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Limba engleză', 'Engleză', 2, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
-- UBB - INFO - INFO-EN - An 2
call year_insert(@profile_id, 'Anul 2', 2, @year_id);
call course_insert(@year_id, 'Metode avansate de programare', 'MAP', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Sisteme de operare distribuite', 'SOD', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Baze de date', 'BD', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Programare logică şi funcţională', 'PLF', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Probabilităţi şi statistică', 'Statistică', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Algoritmica grafelor', 'AG', 3, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Ingineria sistemelor soft', 'ISS', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Gestiunea tranzacţiilor şi baze de date distribuite', 'GTBDD', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Inteligenţă artificială', 'IA', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Reţele de calculatoare', 'Reţele', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);	
call course_insert(@year_id, 'Proiect individual', 'Proiect individual', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);	
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@year_id, 'Tehnici de optimizare', 'Tehnici de optimizare', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Aplicaţii ale logicii', 'Aplicaţii ale logicii', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Programare orientată pe aspecte', 'POA', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Geometrie computaţională', 'Geometrie computaţională', 4, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
-- UBB - INFO - INFO-EN - An 3
call year_insert(@profile_id, 'Anul 3', 2, @year_id);
call course_insert(@year_id, 'Programare Web', 'Programare Web', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Limbaje formale şi tehnici de compilare', 'LFTC', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Algoritmica grafelor', 'AG', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Calcul evolutiv: algoritmi şi operatori', 'CEAO', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Criptografie cu cheie publică', 'Criptografie', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Baze de date spaţiale', 'BDS', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Prelucrarea cunoştinţelor', 'PC', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Protocoale specializate în reţele de calculatoare', 'PSRC', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Realitate virtuală', 'Realitate virtuală', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Modele pentru componentele soft', 'MCS', 5, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Medii de proiectare şi programare', 'MPP', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
call course_insert(@year_id, 'Verificarea şi validarea sistemelor soft', 'VVSS', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Practic", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Seminarii", 0, 2, @folder_id);
call course_insert(@year_id, 'Calcul numeric', 'Calcul numeric', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Proiecte", 0, 2, @folder_id);
call course_insert(@year_id, 'Comunicaţii audio-video în reţele de mare viteză', 'Comunicaţii audio-video', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Aplicaţii multimedia peste web', 'Aplicaţii multimedia', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Proiectare web şi optimizare', 'PWO', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Proiectare avansată de compilatoare', 'PAC', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Aspecte Pragmatice în programare', 'APP', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Prelucrarea informaţiilor într-o organizaţie', 'PIO', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Documentaţie", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Examene", 0, 2, @folder_id);
	call folder_insert(@default_folder_id, "Laboratoare", 0, 2, @folder_id);
call course_insert(@year_id, 'Istoria matematicii', 'Istoria matematicii', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
call course_insert(@year_id, 'Istoria informaticii', 'Istoria informaticii', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);
call course_insert(@year_id, 'Metodologia documentării şi elaborării unei lucrări ştiinţifice', 'MDELS', 6, 2, @course_id, @default_folder_id);
	call folder_insert(@default_folder_id, "Cursuri", 0, 2, @folder_id);