Práce s repozitáøem
Odeslání prvních souborù do repozitáøe

Spustíme/otevøeme si command line (pøíkazovou øádku) a pomocí procházení adresáøovou strukturou se dostaneme do adresáøe, v kterém chceme mít požadovaný projekt. V adresáøi si vytvoøíme textový soubor s název README.md a do nìj si napíšeme napøíklad “Mùj první repozitáø”.

Vytvoøíme z adresáøe pracovní složku pro Git:
git init

Øekneme Gitu, aby zaznamenal nové/zmìnìné soubory:
git add -A

Vytvoøíme skupinu zmìn:
git commit -m "first commit"

Nastavíme repozitáø na GitHubu jako náš výchozí:
git remote add origin git@github.com:login_uzivatele/nazev_repozitare.git

Odešleme všechny commity na GitHub:
git push origin master
– “origin” jsme si výše definovali jako náš výchozí server a repozitáø, “master” je název vìtve, který si git automaticky vytváøí jako defaultní

Nyní, když se podíváte na GitHubu na svùj repozitáø, tak vidíte odeslané soubory. Pokud je souèástí vašich souborù README.md, tak jeho obsah vidíte pod výpisem souborù.
Stažení již existujícího repozitáøe

Pomocí procházení adresáøovou strukturou se dostaneme do adresáøe, v kterém chceme mít umístìnou složku s požadovaným projektem. Složku mùžete, ale nemusíte pøedem vytváøet.

Stažení existujícího repozitáøe:
git clone git@github.com:login_uzivatele/nazev_repozitare.git nazev_slozky
– cestu upravte dle cesty k repozitáøi na GitHubu, “nazev_slozky” pøejmenujte dle toho, jak chcete mít/máte pojmenovaný adresáø, kde bude umístìn projekt
Vytváøení vìtví

Seznam vìtví zjistíte zadáním: git branch , kde právì aktuální vìtev je oznaèena symbolem hvìzdièky (*).

Pokud chcete vytvoøit novou vìtev, tak poèítejte s tím, že nová vìtev bude obsahovat pøesnì takový stav projektu/souborù jako vìtev, ze které ji vytváøíte. Jste-li tedy aktuálnì na “master”, tak nová vìtev bude obsahovat to samé co “master”. Pro vytvoøení vìtve zadejte:
git checkout -b nazev_vetve
– to nám vytvoøí novou vìtev a zároveò nám ji oznaèí jako aktuální, na které zrovna pracujeme.

Pokud nyní znovu zadáte git branch , tak uvidíte 2 vìtve, “master” a novì vytvoøenou, kde u novì vytvoøené bude symbol *.

Jakmile nyní provedeme pøíkaz git push origin nazev_vetve , tak se nám na GitHubu vytvoøí tato vìtev a objeví se tam všechny provedené úpravy. Na GitHubu se mùžete pøesouvat mezi všemi vytvoøenými vìtvemi, které jste tam odeslali a sledovat zmìny v souborech.
Pøepnutí vìtve

Pokud se chceme pøepnout na jinou vìtev, staèí zadat git checkout nazev_vetve . Pozor, pokud jste v pùvodní vìtvi upravili nìjaké soubory, u kterých jste neprovedli operaci commit, tak zmìny v souborech se neprojeví v pùvodní vìtvi, ale pøenesou se zároveò s vámi do pøepnuté vìtve.
Slouèení vìtví

Pokud máme v nìjaké vìtvi zmìny a chceme, aby se zmìny zanesli do aktuální vìtve, zvolíme pøíkaz:
git merge nazev_jine_vetve

Nemusíme se bát nežádoucímu pøepsání souborù. Git merguje inteligentnì a pokud si náhodou neví s nìèím rady, tak vám o tom dá vìdìt a vyžádá, abyste se slouèení provedli ruènì, viz hláška:
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

Git vám pøímo øekne, v kterých souborech se objevil konflikt a co máte udìlat, tedy vyøešit konflikt v souboru a pak commitnout zmìnu. Pokud pøi mergování mìlo dojít ke slouèení více souborù, tak ostatní soubory, u kterých nenastal konflikt, byly bez problému mergnuty a nyní jen staèí vyøešit soubory, v kterých konflikt nastal. Seznam souborù, které nebyly v poøádku mergnuty, mùžete zobrazit pøíkazem:
git status

Pokud si nyní otevøeme soubor README.md, tak Git nám tam oznaèil konflikt takto:
README.md
Mùj první repozitáø
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
	
Mùj první repozitáø
<<<<<<< HEAD
CCC
=======
AAA
>>>>>>> master

To co je obaleno mezi  <<<<<<< HEAD a  ======= oznaèuje zmìny, které máte ve vaší aktuální vìtvi, a to co je obaleno mezi ======= a >>>>>>> master oznaèuje zmìny, které jsem se pokusil mergnout z vìtve “master”.

Pøedpokládejme, že požadujeme úpravu v naší aktuální vìtvi za tu správnou. Upravíme soubor tak, aby vypadal správnì takto:
README.md
Mùj první repozitáø
CCC
1
2
	
Mùj první repozitáø
CCC

Nyní už jen staèí spustit pøíkazy:
Shell
git add -A
git commit -m "text informujici o oprave"
1
2
	
git add -A
git commit -m "text informujici o oprave"

Pozn.: Pokud máte v konfliktu více souborù, doporuèuji místo git add -A použít po každém ruènì upraveném souboru pøíkaz git add nazev_souboru . Tímto zpùsobem budete moct prùbìžnì pøíkazem git status sledovat, které soubory ještì musíte upravit. V pøípadì nechtìného použití git add -A se všechny soubory oznaèí, aniž byste je upravili a již pomocí git status nezjistíte, které soubory je potøeba upravit kvùli konfliktu.
Aktualizace vìtve z GitHubu

Pokud si chceme aktualizovat vìtev obsahem, který je na GitHubu (nìkdo jiný provedl nìjaké úpravy, nebo si jen pøenášíme mezi více PC rozdìlanou práci), tak si nejdøíve pomocí git branch zkontrolujeme, že jsme ve správné vìtvi, a poté jen staèí pøíkaz:
git pull origin nazev_vetve

Pøi pullování vìtve platí stejná pravidla jako pøi mergování a jeho konfliktech.
Stažení vìtve z GitHubu, která na lokálním PC ještì neexistuje

Pokud máte již u sebe nastavený repozitáø, ale na GitHubu existuje vìtev, kterou u sebe lokálnì nemáte vytvoøenou, tak si ji potøebujeme vytvoøit a stáhnout. Šlo by to samozøejmì provést pomocí pøíkazù, které jsme výše již použili, ale mohlo byt dojít k chybám a k tomuto úèelu je vhodnìjší použít následující pøíkaz:
git fetch origin nazev_vetve_na_githubu:nazev_vetve_na_lokalu

Vìtšinou doporuèuji, aby oba názvy vìtví byly totožné. Pak už jen staèí se pomocí checkoutu pøepnout na danou vìtev.
Vývojový cyklus

Cyklus práce pro vývojáøe probíhá vìtšinou stejným zpùsobem, jen obèas je potøeba udìlat nìjaké úkony navíc. Pøedpokládejme, že máme již nastavený potøebný repozitáø jak na GitHubu, tak na lokálním PC.
Nový úkol

    Byl mi pøidìlen nový úkol.
    Zkontroluji si, že jsem ve vìtvi “master”: git branch
    Pokud jsem v jiné vìtvi, pøepnu se na “master”: git checkout master
    Aktualizuji “master” pro pøípad, kdyby tam nìkdo provedl zmìny:
    git pull origin master 
    Vytvoøím novou vìtev: git checkout -b nova_vetev 
    Provedu zmìny v souborech.
    Oznámím Gitu, že jsem nìco zmìnil: git add -A
    Zmìny zabalím do skupiny zmìn: git commit -m "zprava" 
    Odešlu zmìny na GitHub: git push origin nazev_vetve 

Pokraèování na existujícím úkolu

    Byl mi pøidìlen již existující úkol.
    Zjistím, zda jsem na požadované vìtvi, èi zda požadovaná vìtev u mì existuje:
    git branch 
    Pokud vìtev na lokálním PC neexistuje, stáhnu si ji z GitHubu:
    git fetch origin nazev_vetve:nazev_vetve 
    Pokud jsem na jiné vìtvi, pøepnu se na požadovanou vìtev:
    git checkout nazev_vetve 
    Pokud jsme neprovádìli bod 3, aktualizuji si vìtev z GitHubu:
    git pull origin nazev_vetve 
    Provedu zmìny v souborech.
    Oznámím Gitu, že jsem nìco zmìnil: git add -A
    Zmìny zabalím do skupiny zmìn: git commit -m "zprava" 
    Odešlu zmìny na GitHub:  git push origin nazev_vetve
    Pøípadnì body 5 – 9 opakuji.

Závìr

Probrali jsme základní použití nástroje Git s využitím online serveru pro ukládání dat GitHub. Celý èlánek je jen krátkým výbìrem toho, co lze v Gitu a v GitHubu provádìt, a tak vás níže odkáži na odkazy, které s v pøípadì potøeby mùžete prostudovat.
Odkazy

http://git-scm.com/book/cs/

http://www.fuzzy.cz/cs/projekty/git-uzivatelska-prirucka/

https://github.com/

https://bitbucket.org/

http://windows.github.com/
