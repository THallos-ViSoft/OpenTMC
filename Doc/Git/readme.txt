Pr�ce s repozit��em
Odesl�n� prvn�ch soubor� do repozit��e

Spust�me/otev�eme si command line (p��kazovou ��dku) a pomoc� proch�zen� adres��ovou strukturou se dostaneme do adres��e, v kter�m chceme m�t po�adovan� projekt. V adres��i si vytvo��me textov� soubor s n�zev README.md a do n�j si nap�eme nap��klad �M�j prvn� repozit���.

Vytvo��me z adres��e pracovn� slo�ku pro Git:
git init

�ekneme Gitu, aby zaznamenal nov�/zm�n�n� soubory:
git add -A

Vytvo��me skupinu zm�n:
git commit -m "first commit"

Nastav�me repozit�� na GitHubu jako n� v�choz�:
git remote add origin git@github.com:login_uzivatele/nazev_repozitare.git

Ode�leme v�echny commity na GitHub:
git push origin master
� �origin� jsme si v��e definovali jako n� v�choz� server a repozit��, �master� je n�zev v�tve, kter� si git automaticky vytv��� jako defaultn�

Nyn�, kdy� se pod�v�te na GitHubu na sv�j repozit��, tak vid�te odeslan� soubory. Pokud je sou��st� va�ich soubor� README.md, tak jeho obsah vid�te pod v�pisem soubor�.
Sta�en� ji� existuj�c�ho repozit��e

Pomoc� proch�zen� adres��ovou strukturou se dostaneme do adres��e, v kter�m chceme m�t um�st�nou slo�ku s po�adovan�m projektem. Slo�ku m��ete, ale nemus�te p�edem vytv��et.

Sta�en� existuj�c�ho repozit��e:
git clone git@github.com:login_uzivatele/nazev_repozitare.git nazev_slozky
� cestu upravte dle cesty k repozit��i na GitHubu, �nazev_slozky� p�ejmenujte dle toho, jak chcete m�t/m�te pojmenovan� adres��, kde bude um�st�n projekt
Vytv��en� v�tv�

Seznam v�tv� zjist�te zad�n�m: git branch , kde pr�v� aktu�ln� v�tev je ozna�ena symbolem hv�zdi�ky (*).

Pokud chcete vytvo�it novou v�tev, tak po��tejte s t�m, �e nov� v�tev bude obsahovat p�esn� takov� stav projektu/soubor� jako v�tev, ze kter� ji vytv���te. Jste-li tedy aktu�ln� na �master�, tak nov� v�tev bude obsahovat to sam� co �master�. Pro vytvo�en� v�tve zadejte:
git checkout -b nazev_vetve
� to n�m vytvo�� novou v�tev a z�rove� n�m ji ozna�� jako aktu�ln�, na kter� zrovna pracujeme.

Pokud nyn� znovu zad�te git branch , tak uvid�te 2 v�tve, �master� a nov� vytvo�enou, kde u nov� vytvo�en� bude symbol *.

Jakmile nyn� provedeme p��kaz git push origin nazev_vetve , tak se n�m na GitHubu vytvo�� tato v�tev a objev� se tam v�echny proveden� �pravy. Na GitHubu se m��ete p�esouvat mezi v�emi vytvo�en�mi v�tvemi, kter� jste tam odeslali a sledovat zm�ny v souborech.
P�epnut� v�tve

Pokud se chceme p�epnout na jinou v�tev, sta�� zadat git checkout nazev_vetve . Pozor, pokud jste v p�vodn� v�tvi upravili n�jak� soubory, u kter�ch jste neprovedli operaci commit, tak zm�ny v souborech se neprojev� v p�vodn� v�tvi, ale p�enesou se z�rove� s v�mi do p�epnut� v�tve.
Slou�en� v�tv�

Pokud m�me v n�jak� v�tvi zm�ny a chceme, aby se zm�ny zanesli do aktu�ln� v�tve, zvol�me p��kaz:
git merge nazev_jine_vetve

Nemus�me se b�t ne��douc�mu p�eps�n� soubor�. Git merguje inteligentn� a pokud si n�hodou nev� s n���m rady, tak v�m o tom d� v�d�t a vy��d�, abyste se slou�en� provedli ru�n�, viz hl�ka:
Shell
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
1
2
3
	
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.

Git v�m p��mo �ekne, v kter�ch souborech se objevil konflikt a co m�te ud�lat, tedy vy�e�it konflikt v souboru a pak commitnout zm�nu. Pokud p�i mergov�n� m�lo doj�t ke slou�en� v�ce soubor�, tak ostatn� soubory, u kter�ch nenastal konflikt, byly bez probl�mu mergnuty a nyn� jen sta�� vy�e�it soubory, v kter�ch konflikt nastal. Seznam soubor�, kter� nebyly v po��dku mergnuty, m��ete zobrazit p��kazem:
git status

Pokud si nyn� otev�eme soubor README.md, tak Git n�m tam ozna�il konflikt takto:
README.md
M�j prvn� repozit��
<<<<<<< HEAD
CCC
=======
AAA
>>>>>>> master
1
2
3
4
5
6
	
M�j prvn� repozit��
<<<<<<< HEAD
CCC
=======
AAA
>>>>>>> master

To co je obaleno mezi  <<<<<<< HEAD a  ======= ozna�uje zm�ny, kter� m�te ve va�� aktu�ln� v�tvi, a to co je obaleno mezi ======= a >>>>>>> master ozna�uje zm�ny, kter� jsem se pokusil mergnout z v�tve �master�.

P�edpokl�dejme, �e po�adujeme �pravu v na�� aktu�ln� v�tvi za tu spr�vnou. Uprav�me soubor tak, aby vypadal spr�vn� takto:
README.md
M�j prvn� repozit��
CCC
1
2
	
M�j prvn� repozit��
CCC

Nyn� u� jen sta�� spustit p��kazy:
Shell
git add -A
git commit -m "text informujici o oprave"
1
2
	
git add -A
git commit -m "text informujici o oprave"

Pozn.: Pokud m�te v konfliktu v�ce soubor�, doporu�uji m�sto git add -A pou��t po ka�d�m ru�n� upraven�m souboru p��kaz git add nazev_souboru . T�mto zp�sobem budete moct pr�b�n� p��kazem git status sledovat, kter� soubory je�t� mus�te upravit. V p��pad� necht�n�ho pou�it� git add -A se v�echny soubory ozna��, ani� byste je upravili a ji� pomoc� git status nezjist�te, kter� soubory je pot�eba upravit kv�li konfliktu.
Aktualizace v�tve z GitHubu

Pokud si chceme aktualizovat v�tev obsahem, kter� je na GitHubu (n�kdo jin� provedl n�jak� �pravy, nebo si jen p�en��me mezi v�ce PC rozd�lanou pr�ci), tak si nejd��ve pomoc� git branch zkontrolujeme, �e jsme ve spr�vn� v�tvi, a pot� jen sta�� p��kaz:
git pull origin nazev_vetve

P�i pullov�n� v�tve plat� stejn� pravidla jako p�i mergov�n� a jeho konfliktech.
Sta�en� v�tve z GitHubu, kter� na lok�ln�m PC je�t� neexistuje

Pokud m�te ji� u sebe nastaven� repozit��, ale na GitHubu existuje v�tev, kterou u sebe lok�ln� nem�te vytvo�enou, tak si ji pot�ebujeme vytvo�it a st�hnout. �lo by to samoz�ejm� prov�st pomoc� p��kaz�, kter� jsme v��e ji� pou�ili, ale mohlo byt doj�t k chyb�m a k tomuto ��elu je vhodn�j�� pou��t n�sleduj�c� p��kaz:
git fetch origin nazev_vetve_na_githubu:nazev_vetve_na_lokalu

V�t�inou doporu�uji, aby oba n�zvy v�tv� byly toto�n�. Pak u� jen sta�� se pomoc� checkoutu p�epnout na danou v�tev.
V�vojov� cyklus

Cyklus pr�ce pro v�voj��e prob�h� v�t�inou stejn�m zp�sobem, jen ob�as je pot�eba ud�lat n�jak� �kony nav�c. P�edpokl�dejme, �e m�me ji� nastaven� pot�ebn� repozit�� jak na GitHubu, tak na lok�ln�m PC.
Nov� �kol

    Byl mi p�id�len nov� �kol.
    Zkontroluji si, �e jsem ve v�tvi �master�: git branch
    Pokud jsem v jin� v�tvi, p�epnu se na �master�: git checkout master
    Aktualizuji �master� pro p��pad, kdyby tam n�kdo provedl zm�ny:
    git pull origin master 
    Vytvo��m novou v�tev: git checkout -b nova_vetev 
    Provedu zm�ny v souborech.
    Ozn�m�m Gitu, �e jsem n�co zm�nil: git add -A
    Zm�ny zabal�m do skupiny zm�n: git commit -m "zprava" 
    Ode�lu zm�ny na GitHub: git push origin nazev_vetve 

Pokra�ov�n� na existuj�c�m �kolu

    Byl mi p�id�len ji� existuj�c� �kol.
    Zjist�m, zda jsem na po�adovan� v�tvi, �i zda po�adovan� v�tev u m� existuje:
    git branch 
    Pokud v�tev na lok�ln�m PC neexistuje, st�hnu si ji z GitHubu:
    git fetch origin nazev_vetve:nazev_vetve 
    Pokud jsem na jin� v�tvi, p�epnu se na po�adovanou v�tev:
    git checkout nazev_vetve 
    Pokud jsme neprov�d�li bod 3, aktualizuji si v�tev z GitHubu:
    git pull origin nazev_vetve 
    Provedu zm�ny v souborech.
    Ozn�m�m Gitu, �e jsem n�co zm�nil: git add -A
    Zm�ny zabal�m do skupiny zm�n: git commit -m "zprava" 
    Ode�lu zm�ny na GitHub:  git push origin nazev_vetve
    P��padn� body 5 � 9 opakuji.

Z�v�r

Probrali jsme z�kladn� pou�it� n�stroje Git s vyu�it�m online serveru pro ukl�d�n� dat GitHub. Cel� �l�nek je jen kr�tk�m v�b�rem toho, co lze v Gitu a v GitHubu prov�d�t, a tak v�s n�e odk�i na odkazy, kter� s v p��pad� pot�eby m��ete prostudovat.
Odkazy

http://git-scm.com/book/cs/

http://www.fuzzy.cz/cs/projekty/git-uzivatelska-prirucka/

https://github.com/

https://bitbucket.org/

http://windows.github.com/
