# TASK 1
        Pentru acest task primul lucru pe care trebuie sa-l fac este sa
    delimitez din numarul primit ca parametru cele 2 varibile : id-ul furnicii
    si lista sa de permisiuni,
        Pentru id trebuie sa extrag primii 8 biti, ceea ce inseamna ca shiftez
    numarul cu 24 de biti la dreapta, nu inainte de a salva intr-o alta
    varibila pentru a nu pierde numarul initial. 
        Pentru a extrage permisiunile furnicii trebuie sa fac primii 8 biti 0,
    fac acest lucru shiftand o data la stanga cu 8 biti si dupa din nou la
    dreapta cu 8 biti, pierzand astfel bitii anteriori.
        Incep prin a presupune ca salile sunt corecte (initializez ebx cu 1),
    iar cand gaseste o necorespondenta rezultatul devine 0. Incep loop-ul la
    inceputul caruia trebuie sa verific daca mai exista sali care au ramas
    neverificate (adica daca edx este 0), iar daca edx nu este 0 (inca mai
    sunt sali) continua, altfel sare la final si iese din loop. 
    Daca mai am sali de verificat, iau fiecare pereche de biti in parte si
    compar doar intre salile in care furnicuta doreste sa intre. Verific
    daca furnicuta doreste sa intre in sala curenta (adica daca ultimul bit
    din edx este 0), iar daca nu doreste, sterg ultimul bit atat din lista
    de permisiuni, cat si din lista de dorinte si trec la urmatoarea pereche.
        Daca, in schimb, doreste sa intre in sala (edx are ultimul bit 1)
    trebuie sa compar cu bitul corespondent din lista de permisuni: daca in
    lista de permisuni gaseste 0, rezultatul devine 0 si iese din loop, iar
    daca gaseste 1 inseamna ca se respecta in continuare conditia si trece la
    urmatoarea pereche. Daca a terminat loop-ul si toate au fost respectate,
    rezultatul va fi 1, altfel rezultatul e 0.
