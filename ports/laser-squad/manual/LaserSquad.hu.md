# Laser Squad - Játékosok kézikönyve

![Laser Squad borító](images/cover.jpeg)

*Blade Software Limited, Brooklands, New Road, St. Ives, Huntingdon, Cambridgeshire PE17 4RG.*

## Bevezetés

A Laser Squad egy- vagy kétjátékos taktikai háborús játékrendszer, amely az egyéni szintű harc számos vonatkozását pontosan szimulálja. Egy új játékosnak időbe telik, mire megismeri a rendszer minden részletét, ezért azt javasoljuk, hogy töltsd be a programot, és menj végig a kézikönyv első részén, amely alapvető útmutatót ad a játékhoz. A második részt tapasztalt játékosok számára összeállított kézikönyvként érdemes kezelni. A rendszer néhány szolgáltatása nincs megvalósítva a főprogrammal együtt szállított öt küldetésben, de a jövőbeli küldetések majd feltárják a Laser Squad játékmenetének sokoldalúságát. A füzet záró része a főprogrammal szállított öt küldetés leírását tartalmazza.

## A játék betöltése (kazetta)

A Laser Squad mindig két részletben töltődik be. Először a főprogramot kell betölteni, amely a kazetta első oldalának elején található. Miután ez betöltődött, ki kell választanod a játszani kívánt küldetést, majd be kell tölteni a megfelelő küldetésadat-fájlt a főprogramba.

## Betöltési útmutató

### Spectrum 48K vagy 128K

1. Csatlakoztasd a magnó fülhallgató-kimenetét a Spectrum EAR aljzatához.
2. Told vissza a kazettát az első oldal elejére.
3. Állítsd a hangerőt és a hangszínt magasra.
4. Írd be: `LOAD ""`, majd nyomd meg az ENTER billentyűt.
5. Nyomd meg a PLAY gombot a magnón.

### CBM64

1. Indulj ki a kikapcsolt Commodore-ból.
2. Távolíts el minden perifériát a joystick, a magnó és a képernyő kivételével. A magnó legyen a lehető legtávolabb a tévétől.
3. Kapcsold be, és ellenőrizd, hogy a kazetta vissza van tekerve az első oldal elejére.
4. Tartsd lenyomva a SHIFT billentyűt, és nyomd meg a RUN/STOP-ot.
5. Nyomd meg a PLAY gombot a magnón.

### CBM64 (lemez)

1. Írd be: `LOAD "LS",8`.
2. Írd be: `RUN`, majd nyomd meg a RETURN billentyűt.

### Amstrad CPC 464/6128

1. Told vissza a kazettát az első oldal elejére.
2. Tartsd lenyomva a CTRL-t, és nyomd meg a kis ENTER billentyűt.
3. Nyomd meg a PLAY gombot a magnón.

Amikor a program betöltődött, állítsd le a magnót. Válaszd ki a játszani kívánt küldetést a küldetés számának megnyomásával. Ha egy korábban elmentett játékot szeretnél betölteni, nyomd meg a '4'-et. Az első és a második küldetés a főprogram után található, ezért ha az elsőt vagy a másodikat választottad, nyomd meg a PLAY gombot a magnón. Ha másik küldetést választottál, told vissza a kazettát a második oldal elejére, és nyomd meg a PLAY gombot.

### Commodore Amiga

Kapcsold be a gépet, majd tedd be a lemezt az A meghajtóba. Néhány másodperc múlva megjelenik a címképernyő.

### Atari ST

Kapcsold be a gépet, majd tedd be a lemezt az A meghajtóba. Néhány másodperc múlva megjelenik a címképernyő.

### Videoton TV Computer (lemez)

Ez lemezes átirat, ezért floppy meghajtóval felszerelt TVC szükséges hozzá.

1. Tedd be a Laser Squad lemezt a meghajtóba.
2. Írd be: `LOAD "*"`, majd nyomd meg az ENTER billentyűt.
3. Amikor a program betöltődött, válaszd ki a küldetést a főmenüből a fent leírtak szerint.

A játék mentése a kazetta helyett a lemezre történik.

> **Fontos:** ha a főmenüből induláskor mentett játékot töltesz be, akkor a joystick lesz az aktív vezérlő, amíg át nem állítod a vezérlést. TVC-n ez nem okozhat gondot, mert a gépnek beépített joystickja van.

## Használat

### Billentyűk (vagy joystick)

| Billentyű | Irány | Joystick |
| :-- | :-- | :-- |
| Q | Balra | Joystick balra |
| A | Jobbra | Joystick jobbra |
| O | Fel | Joystick fel |
| P | Le | Joystick le |
| SPACE | Kiválasztás/Tűz | Joystick tűz |

### Vezérlés módosítása

Erre nincs lehetőség - a billentyűzet és a joystick egyszerre használható.

### Játék mentése

Tegyél egy üres, formázott lemezt a belső meghajtóba. Ne használd a lemezt semmilyen más célra.

---

# 1. rész: A játék menete

## Áttekintés

A Laser Squad játékmenetek (körök) sorozatából áll. Minden játékos a saját köre alatt néhány egységet irányít, amelyek embereket, droidokat vagy más lényeket jelképeznek. Minden egységnek saját neve és tulajdonságai vannak, amelyek befolyásolják az egység képességeit és tevékenységét. Minden kör elején minden egység kap egy bizonyos számú Akciópontot (Action Point, röviden AP), amelyet az egység minden tevékenységére - mozgásra, harcra, tárgyak kezelésére stb. - elhasználhat. Ha egy játékos minden egységének elfogytak az akciópontjai, vagy nem kíván többet felhasználni, az 'end turn' (kör vége) lehetőséget választja, és a másik játékos (vagy a számítógép) következik. A játékot az nyeri, aki először gyűjt össze 100 győzelmi pontot. Győzelmi pontot különféle dolgokért kapsz, például ellenséges egységek kiiktatásáért vagy bizonyos létesítmények megsemmisítéséért, attól függően, melyik küldetést játszod.

## A játék beállítása

A játék megkérdezi, egyjátékos vagy kétjátékos játékot szeretnél-e. Ha az egyjátékos lehetőséget választod, a számítógép átveszi a második fél irányítását. Ezután megkérdezi, milyen szinten szeretnél játszani. A szintek száma küldetésenként eltér, és minél magasabb a szint, annál nehezebb legyőzni a számítógépet. Ha ketten játszotok, csak annak a játékosnak szabad látnia a képernyőt, akinek a köre van.

Ezután minden játékos kiválasztja a felszerelést, és felállítja az egységeit.

## Felszerelés kiválasztása

Minden küldetésben egy bizonyos mennyiségű Kreditet (Credit) kapsz, amelyet páncélzatra, fegyverekre és lőszerre költhetsz. Először minden egységhez ki kell választanod a páncélzatot. Az egységeid a képernyő bal oldalán láthatók, és egymás után választasz páncélt mindegyikhez. A FEL és LE vezérlővel válaszd ki a páncél típusát, és nyomd meg a TŰZ-et, ha elégedett vagy a választásoddal. Ha a '0'-t választod, az egységnek nem lesz páncélzata. Ha egytől négyig választasz számot, az egység a képernyő jobb oldalán látható táblázatban megadott jellemzőkkel rendelkező páncélt kap. A páncélzat teljes magyarázatát a referencia rész tartalmazza.

Miután minden egységnek kiosztottad a páncélt, kiválasztod a felszerelést. Kezdetben a tárgyválasztó van kiemelve. A JOBBRA és BALRA vezérlővel válthatsz a kiválasztott tárgyak között. Minden tárgy egyedi grafikus jele és neve látható a beszerzési költségével együtt. Ha tárgyat szeretnél kiosztani egy egységnek, a FEL és LE vezérlővel emeld ki a kívánt egységet, majd a JOBBRA gombbal add hozzá az aktuálisan kiválasztott tárgyat az egység felszereléséhez, vagy a BALRA gombbal vedd el. Nem adhatsz tárgyat egy egységnek, ha nincs elég kredited, vagy ha ezzel túllépnéd az egység súly- vagy méretkorlátját. Ha elégedett vagy a választásoddal, nyomd meg kétszer a TŰZ-et a játék folytatásához.

Minden fegyver megvásárláskor meg van töltve lőszerrel, de minden fegyverhez kapható extra lőszer is. A fegyverekről és a lőszerről a referencia rész fegyvertáblázatában találsz részleteket.

## Felállítás

Az egységeket sorban egymás után kell elhelyezni a térképen, amíg mind le nem kerül. A felállítási módban a képernyő jobb oldalán a következőként elhelyezendő egység neve és felszerelése látható, bal oldalon pedig a térképablak. A FEL, LE, BALRA és JOBBRA vezérlővel mozgasd a villogó fehér kurzort a térképen, amíg meg nem találod a kívánt felállítási mezőt. Minden küldetés megadja, mely mezőkre állíthatod fel az egységeidet. Vidd a kurzort a felállítási mező fölé, és nyomd meg a TŰZ-et az egység elhelyezéséhez.

## Játékbeállítások

Minden játékmenet kezdete előtt egy menü jelenik meg, amely lehetővé teszi a játékok mentését és betöltését. Nyomd meg a kívánt lehetőség számát, vagy a TŰZ-et a játék folytatásához.

- **CHANGE CONTROLS:** Lehetővé teszi, hogy a vezérlést különböző joystickok vagy a billentyűzet között módosítsd (csak Spectrumon).
- **SAVE GAME:** Lehetővé teszi az aktuális játék mentését kazettára. A lehetőség kiválasztása előtt győződj meg róla, hogy a magnón a felvétel és a lejátszás gombja is le van nyomva.
- **LOAD GAME:** Ha ezt a lehetőséget választod, az aktuális játék félbeszakad egy új játék betöltése érdekében. Ugyanaz a menü jelenik meg, mint a főprogram első betöltődésekor.
- **VERIFY GAME:** Ha az aktuális játékot épp kazettára mentetted, ezzel a lehetőséggel ellenőrizheted, hogy rendben el lett-e mentve.

## Kurzor mód

A játék bármikor három különböző mód egyikében van: kurzor mód, kiválasztó mód (select mode) vagy lövő mód (fire mode). Minden játékmenet kurzor módban kezdődik, amely egyszerűen lehetővé teszi, hogy a FEL, LE, BALRA és JOBBRA vezérlővel mozgasd a kurzort a térképen. A képernyő jobb oldalán látható kijelző a kurzor alatti térképmezőről ad információt a következők szerint:

| Mező | Jelentés |
| :-- | :-- |
| MAP | A terepelem neve, például fű, padló, fal stb. |
| OBJECT | A földön fekvő tárgy neve, ha van. |
| UNIT | A kurzor alatt álló egység neve, ha van. |
| OBJECT IN USE | Az a tárgy, amelyet az egység éppen használ, ha van. |

### Kurzor módú lehetőségek

A Laser Squadot menük sorozatán keresztül irányítod, amelyek egyszerűen az éppen elérhető lehetőségek listái. Menü megjelenítéséhez - bármelyik módban is vagy - nyomd meg a TŰZ-et. A FEL és LE vezérlővel emeld ki a kívánt lehetőséget, majd a TŰZ-gombbal válaszd ki. A kurzor módban elérhető lehetőségek a következők:

| Lehetőség | Leírás |
| :-- | :-- |
| SELECT | Ha a kurzor egy olyan saját egységed fölött áll, amelynek még vannak AP-i, kiválaszthatod az egységet mozgásra és egyéb műveletekre. A lehetőség kiválasztása után kiválasztó módba lépsz. |
| INFO | Ha a kurzor bármely egység fölött áll, megjeleníthető az egységre vonatkozó információ. |
| NEXT UNIT | Ez a lehetőség egyszerűen egy másik, még AP-vel rendelkező saját egységhez viszi a kurzort. |
| SCANNER | Megjeleníthető a teljes játékterület stratégiai térképe, amelyen látszik az összes saját egységed és minden jelenleg észlelt ellenséges egység helyzete. |
| CANCEL | A mégse lehetőség minden menüben egyszerűen törli a menüt, és visszatér az aktuális módhoz. |

## Kiválasztó mód (select mode)

Kiválasztó módban a képernyő jobb oldalán lévő üzenetkijelző a kiválasztott egységről mutat fontos információkat (lásd az 1. ábrát). A legfontosabb a hátralévő Akciópontok száma és az iránymutató, amely megmutatja, merre néz az egység. Miután kiválasztottál egy egységet, az irányvezérlőkkel mozgathatod az egységet a következők szerint:

| Vezérlő | Hatás |
| :-- | :-- |
| BALRA | Az egység balra fordul |
| JOBBRA | Az egység jobbra fordul |
| FEL | Az egység előre lép abba az irányba, amerre néz |
| LE | Az egység hátrafelé mozog |

### Kiválasztó mód kijelzője

![1. ábra - Kiválasztó mód kijelzője](images/fig1-select-mode-display.jpeg)

*1. ábra.* A kijelző fentről lefelé a következőket mutatja: az egység neve (itt Corporal Jonlan), a hátralévő Akciópontok (34), a lehetőségi tűzhöz szükséges minimális Akciópontok (25), az iránymutató, az egység morálja (GOOD), állóképessége (SUPERB), sebesülései (2), terhelése (6), a használatban lévő tárgy (M4000 Auto-Gun), a talaj, amelyen az egység áll (Rock Dust) a védelmi értékével (0), és az észlelt ellenséges egységek száma (2).

## Mozgás

Egy egység mozgatása mindig Akciópontokba kerül, a megtett terep függvényében. Átlós mozgás további két AP-be kerül, az egység 45°-os elfordítása pedig egy AP-be. Ha járhatatlan terepre próbálsz lépni, az egység megtámadja a terepet, és esetleg megsemmisíti.

Átmozoghatsz a kiválasztott egységgel a saját egységeid fölött, de a mozgást soha nem fejezheted be egy másik saját egység tetején. Egy másik egységen álló egység számára az egyetlen lehetőség a mozgás folytatása vagy az END MOVE lehetőség kiválasztása a menüből. Ha az END MOVE lehetőséget választod, az egység az utolsó üres mezőre kerül, amelyet elfoglalt.

## Közelharc

Közelharcba úgy kerülhetsz, ha egyszerűen az egységedet egy ellenséges egységbe mozgatod. A jobb oldali közelharc-kijelző megmutatja, milyen fegyvert használ az egység (ha használ), a pontosságot (találati esély %-ban), az AP-költséget, a sebzést és a találat helyét.

## Látómező

A Laser Squad rejtett mozgású rendszert használ, ami azt jelenti, hogy az ellenséges egységek nem jelennek meg a térképen, hacsak nem tartoznak valamelyik egységed látómezejébe. Egy egység látómezeje elölről 45°-ban terjed ki. Különféle terepelemek, például falak vagy ajtók, akadályozzák a rálátást. Egy ellenséges egységet addig nem látsz, amíg tisztán a látómezőbe nem kerül.

## Kiválasztó módú lehetőségek

Ha kiválasztó módban megnyomod a TŰZ-et, az egység körülményeitől függően különféle menülehetőségeket kapsz. E lehetőségek többsége az egység Akciópont-keretének (Action Point Allowance) százalékában számított AP-be kerül. Például ha egy egység a kör elején 50 AP-t kap, akkor egy tárgy cseréje az AP-keret 20%-ába, vagyis 10 AP-be kerül. A műveletek nem hajthatók végre, ha az egységnek nincs elég AP-je (bár a lehetőség ilyenkor is szerepel a menüben).

Kiválasztó módban a következő menülehetőségek érhetők el:

| Lehetőség | Leírás | AP-költség |
| :-- | :-- | :-- |
| END MOVE | Befejezi az egység kiválasztását, és visszatér a kurzor módhoz. Az egység újra kiválasztható, amíg van AP-je. | - |
| FIRE | Ha az egységnek van használatban lévő tárgya, azzal lőni vagy dobni lehet. A lehetőség kiválasztásakor a kijelző lövő módra vált. | - |
| CHANGE | Ha az egység egy vagy több tárgyat hord, ezzel a lehetőséggel választhatsz használatra tárgyat, vagy cserélheted a használatban lévőt. Az egység tárgyai megjelennek a képernyőn, mindegyik tárgy lőszermennyiségével, súlyával és méretével. A bal oldali fehér mutató jelzi, melyik tárgy van éppen használatban, ha van ilyen. A FEL és LE vezérlővel vidd a mutatót a használni kívánt tárgyra, és nyomd meg a TŰZ-et a csere végrehajtásához. | 25% |
| PICK UP | Ha az egység olyan mezőn áll, amelyen egy vagy több tárgy van a földön, azokat fel lehet venni. Ez a lehetőség a mezőn lévő összes tárgyat megjeleníti a tárgycseréhez hasonló módon. A FEL és LE vezérlővel vidd a mutatót a felvenni kívánt tárgyra, és nyomd meg a TŰZ-et a művelet végrehajtásához. Ha nem akarsz tárgyat felvenni, vidd a mutatót a CANCEL-re, és nyomd meg a TŰZ-et. | 50%, ha az egységnek van használatban lévő tárgya, 25%, ha nincs |
| DROP | Ha az egységnek van használatban lévő tárgya, azt le lehet dobni. A ledobott tárgyat el lehet rejteni, a tárgy méretétől és attól a terep befogadóképességétől függően, amelyen az egység áll. Például egy gránátot elrejthetsz egy virágcserépben, egy puskát nem; padlómezőn semmit nem rejthetsz el, de egy ágy alatt a legtöbb dolgot igen. Ha a ledobott tárgyat el lehet rejteni, egy kis menü jelenik meg, amely megkérdezi, el akarod-e rejteni a tárgyat. | 10% |
| LOAD | Ha az egység használatban lévő fegyvere távolsági fegyver, és az egység a hozzá való megfelelő lőszert is hordja, akkor új lőszerrel újratölthető. | 50% |
| PRIME | Ha az egység használatban lévő tárgya egy még be nem élesített gránát, akkor élesíthető. A FEL és LE vezérlővel módosítsd az időzítőt, és nyomd meg a TŰZ-et a gránát élesítéséhez. Az időzítő értéke határozza meg, mikor robban a gránát. Ha az időzítő 0-ra van állítva, a gránát a te köröd végén robban. Ha 1-re, akkor ellenfeled körének végén, ha pedig 2-re, akkor a következő köröd végén, és így tovább. | 20% |
| OPEN | Ha az egység zárt, nem lezárt ajtó felé néz, az kinyitható. | 20% |
| CLOSE | Ha az egység nyitott ajtó felé néz, az becsukható. | 20% |
| UNLOCK | Ha az egység lezárt ajtó felé néz, és a megfelelő kulcsot használja, az ajtó kinyitható. | 25% |
| LOCK | Ha az egység nem lezárt ajtó felé néz, és a megfelelő kulcsot használja, az ajtó lezárható. | 25% |
| SCANNER | A stratégiai térkép AP-költség nélkül megjeleníthető. | 0 |
| CANCEL | Törli a menüt, és visszatér a mozgáshoz. | - |

## Lövő mód (fire mode)

Ha a FIRE lehetőséget választod, a főkijelző perspektivikus térképről a Lőtávolság-térképre (Line of Fire) vált, amely a lövést vagy dobást akadályozó összes terepelemet megmutatja. Minden egységet egy folt helyettesít, amely az egység célterületét ábrázolja. A négyzet alakú kurzort egy villogó célkereszt váltja fel a lövések célzásához. A jobb oldali információs kijelző a használt fegyvert és a távolsági harc legfontosabb adatait mutatja (lásd a 2. ábrát). Fegyver elsütéséhez mozgasd a célkeresztet a kívánt célpontra, nyomd meg a TŰZ-et a lövő mód menüjének megjelenítéséhez, és válaszd ki a kívánt lövéstípust. Nem tudsz lőni, ha a kurzor kívül van az egység látómezején.

### Lövő módú lehetőségek

Csak a távolsági fegyverek rendelkeznek a három tűzlehetőséggel: automata tűz, gyorslövés és célzott lövés. Egyes fegyverek nem képesek automata tűzre. Ha az egység bármilyen más tárgyat használ, csak a dobás lehetősége érhető el.

Lövő módban a következő lehetőségek érhetők el:

- **AUTO:** Az automata tűz két megadott pont közötti folyamatos sorozatlövés. A lehetőség kiválasztásához legalább három lövést kell leadni, és az egységnek legalább három automata lövésre elegendő AP-vel kell rendelkeznie. Az automata tűz kiválasztása után meg kell adnod egy második célpontot az egység látómezején belül. Nyomd meg a TŰZ-et, ha a kurzort a kívánt pontra vitted. Ezután meg kell adnod a leadandó lövések számát háromtól az egység Akciópontjai által megengedett maximumig. A FEL és LE vezérlővel módosítsd a lövések számát, és nyomd meg a TŰZ-et a lövések végrehajtásához.
- **SNAP:** A gyorslövés egyetlen lövés, de pontosabb az automata tűznél.
- **AIM:** A célzott lövés a legpontosabb lövéstípus, de a legtöbb Akciópontba kerül.
- **THROW:** Bármely tárgy eldobható az egység ereje osztva a tárgy súlyával által meghatározott távolságig. Egy tárgyat soha nem dobsz messzebbre, mint a kurzor, ami meglehetősen pontos tárgyelhelyezést tesz lehetővé. A dobás pontossága megegyezik az egység ügyességi értékével, a költsége pedig az egység AP-keretének 20%-a. Ha az eldobott tárgy eltalál egy másik egységet, az elkaphatja a tárgyat, feltéve, hogy az egység a dobó felé néz, és nincs használatban lévő tárgya. Ha a tárgyat nem kapja el, az az egység lábához esik.
- **INFO:** Ha a kurzor egy egység fölött áll, megjeleníthető az egységre vonatkozó információ.
- **END FIRE:** Kilép a lövő módból, és visszatér a kiválasztó módba.
- **CANCEL:** Törli a menüt.

### Lövő mód kijelzője

![2. ábra - Lövő mód kijelzője](images/fig2-fire-mode-display.jpeg)

*2. ábra.* A kijelző a fegyver nevét (itt Sniper Rifle), az egység hátralévő Akciópontjait (34), a fegyverben lévő lőszert (12), majd az egyes lövéstípusok pontosságát (ACC) és Akciópont-költségét (AP) mutatja: automata lövés (N.A. - a Sniper Rifle nem képes automata tűzre), gyorslövés (31% pontosság a fegyverkészséggel együtt, 16 AP), célzott lövés (66%, 33 AP) és dobás (45%, 10 AP).

## Lehetőségi tűz (opportunity fire)

A lehetőségi tűz a Laser Squadban alkalmazott taktika lényeges eleme. Ha egy egységnek a játékmenet végén legalább az Akciópont-keretének fele megmarad, jogosulttá válik a lehetőségi tűzre. Ellenfeled köre alatt a lehetőségi tűz akkor aktiválódik, amikor egy ellenséges egység belép az egységed látómezejébe. Az irányítás lövő módban hozzád kerül, így lelőheted az ellenséges egységet. Amint kiválasztod az END FIRE lehetőséget, ellenfeled folytathatja a körét.

---

# 2. rész: Referencia

## Az egységek jellemzői

Minden egységnek egyedi tulajdonságai vannak, amelyek különféleképpen befolyásolják a játékot.

| Jellemző | Leírás |
| :-- | :-- |
| MORALE VALUE | Minden egység morálértéke az egység értékét jelenti a csapat többi tagja számára. Ha az egységet kiiktatják, a saját oldalán lévő összes egység morálja az egység morálértékével csökken, az ellenséges egységek morálja pedig ugyanennyivel nő. |
| MOVEMENT TYPE | A különböző egységtípusoknak bizonyos terepfajták esetén eltérő az AP-költségük. Például az első küldetés droidjai nem képesek áttaposni a háztartási berendezési tárgyakon. |
| ACTION POINT ALLOWANCE | Ez az Akciópontok száma, amelyet az egység minden kör elején kap. Az egység kezdeti AP-keretét azonban számos tényező módosítja: az egység páncéljának súlya és az egység terhelése is levonódik ebből az értékből. |
| CONSTITUTION | Az egység alkata: az a sebzésmennyiség, amelyet elviselhet, mielőtt kiiktatják. |
| WOUNDS | Ha az egység alkatpontjai csökkennek, az egység sebesüléseket kap, amelyek minden kör elején levonódnak az egység Akciópontjaiból. |
| WOUND RATE | A sebesülési arány az az elvesztett alkatpontok száma, amely egy sebesülés keletkezéséhez szükséges. |
| STAMINA | Ez az érték az egység fizikai erőnlétét, vagyis energiáját jelöli. Ha egy egység AP-inek több mint felét megerőltető tevékenységre, például mozgásra használja, az állóképesség csökken. A fel nem használt AP-k segítenek az állóképesség helyreállításában. Ha az állóképesség olyan alacsony szintre süllyed, hogy az egység elgyengül, akkor minden kör elején csak az AP-keretének felét kapja, amíg az állóképessége pihenéssel helyre nem áll. |
| MORALE | Az egység morálját hátrányosan befolyásolja, ha saját egységeket iktatnak ki, vagy ha egy egység megsebesül. A morál nő (de nem lépheti túl a kezdeti morált), ha ellenséges egységeket iktatnak ki. Ha egy egység pánikba esik, eldobhatja az általa használt tárgyakat. A droidok morálja soha nem csökken. |
| WEAPON SKILL | Ez az érték csak a távolsági harcot befolyásolja. A fegyver készségtényezőjével együtt növelheti a lövés pontosságát. |
| STRENGTH | A hordozható tárgyak súlyát az egység ereje határozza meg. Közelharcban az erő növelheti a fegyver okozta sebzést. |
| AGILITY | A dobás pontossága az egység ügyességétől függ. A közelharcbeli találat pontosságát a támadó és a védekező egység ügyessége is befolyásolja. |
| UNARMED COMBAT | Az egység veleszületett fegyvertelen közelharci képessége. |
| BURDEN | Az egység terhelése levonódik az AP-keretéből. A terhelés értékét az egység ereje és az összes hordott tárgy összsúlya alapján számítják. |
| ARMOUR | Minden egységnek van páncélértéke az elülső, bal, jobb és hátsó oldalára. Az egység irányultsága és a lövés forrása alapján dől el, melyik páncélértéket használják a harci számításokban. A páncél megsérülhet, ha egy lövés vagy találat sebzésértéke nagyobb a páncélértéknél. Az egység alkatát csak a páncélértéknél nagyobb sebzésérték érinti. |
| VICTORY POINTS | Egy egység győzelmipont-értéke hozzáadódik az ellenfél összes győzelmi pontjához, amikor az egységet kiiktatják. |

## Fegyverek és tárgyak

A Laser Squadban a tárgyaknak három alapvető kategóriája van: fegyverek, lőszer és egyéb tárgyak. A fegyvereknek három típusa van: közelharci fegyverek, távolsági fegyverek és gránát jellegű fegyverek. A legtöbb távolsági fegyver közelharcban is használható. A tárgyak az alábbi jellemzők közül néhánnyal vagy mindegyikkel rendelkezhetnek:

| Jellemző | Leírás |
| :-- | :-- |
| WEIGHT | Minden tárgynak van súlyértéke. |
| SIZE | Minden tárgynak van méretértéke. Az egységek a viselt páncél típusától függően korlátozottan vihetnek magukkal tárgyakat az összméret alapján. Ha egy mezőn egynél több tárgy van, a térképen a legnagyobb tárgy jelenik meg. |
| CONSTITUTION | Minden tárgynak van alkatértéke, amely a tárgy megsemmisítéséhez szükséges sebzési tényezőt jelöli. |
| ACTION POINT COST | Ha egy tárgy a földön van, a terep AP-költségén felül a ráálláshoz további AP-költség is járhat. |
| CLOSE COMBAT COST | A fegyver közelharcban való használatához szükséges AP-k százaléka. |
| CLOSE COMBAT ACCURACY | A fegyverrel való találat alapesélye. Közelharcban számos tényező módosítja. |
| CLOSE COMBAT DAMAGE | A fegyver által közelharcban okozott sebzéspontok átlagos mennyisége. |
| CLOSE COMBAT STRENGTH BONUS | Az egység erejének az a százaléka, amely hozzáadódik a közelharci sebzéshez. |
| CLOSE COMBAT AGILITY BONUS | Az egység ügyességének az a százaléka, amely hozzáadódik a közelharci pontossághoz. |
| AUTOMATIC FIRE AP COST | Az egység Akciópont-keretének egyetlen automata lövésre felhasznált százaléka. |
| AUTOMATIC FIRE ACCURACY | A célba találás százalékos esélye. |
| SNAP SHOT AP COST | Az egység Akciópont-keretének egyetlen gyorslövésre felhasznált százaléka. |
| SNAP SHOT ACCURACY | A gyorslövéssel való célba találás százalékos esélye. |
| AIMED SHOT AP COST | Az egység Akciópont-keretének egyetlen célzott lövésre felhasznált százaléka. |
| AIMED SHOT ACCURACY | A célzott lövéssel való célba találás százalékos esélye. |
| SKILL FACTOR | Ez az érték határozza meg, hogy az egység fegyverkészségéből mennyi adódik hozzá a pontossághoz távolsági harcban. |
| RANGED COMBAT DAMAGE | A fegyver által távolsági harcban okozott sebzés átlagos mennyisége. Ha a fegyver robbanó lőszert használ, vagy ha a fegyver gránát jellegű, ez az érték a robbanóerőt jelenti. |
| AMMUNITION | A használt lőszer típusa, ha a tárgy távolsági fegyver. |

## Közelharci számítások

A közelharc pontosságát a következő tényezők összege határozza meg:

1. A fegyver alapvető közelharci pontossága.
2. Add hozzá az ügyességi tényezőt, amelyet a fegyver ügyességi bónusza és a támadó egység ügyessége határoz meg.
3. Vond le az ellenséges egység teljes ügyességét, ha elölről támadják.
4. Vond le az ellenséges egység ügyességének felét, ha oldalról támadják.
5. Vond le az ellenséges egység ügyességének negyedét, ha hátulról támadják.

A közelharci sebzést a következő tényezők összege határozza meg:

1. A fegyver alapvető közelharci sebzése.
2. Add hozzá az erőtényezőt, amelyet a fegyver erőbónusza és a támadó egység ereje határoz meg.
3. Adj hozzá egy véletlen tényezőt, amely az eddig kiszámított sebzésértéket 50% és 150% között módosítja.
4. Vond le a védekező egység páncélértékét azon az oldalon, amelyen találat éri.
5. Vond le a védekező egység által elfoglalt terep védelmi értékét.

## Távolsági harci számítások

A távolsági harc pontosságát a következő tényezők összege határozza meg:

1. A fegyver alappontossága a lövés típusától függően.
2. Ha a lövés gyorslövés, adj hozzá a fegyver készsége és a lövő egység fegyverkészsége által meghatározott készségbónuszt.
3. Ha a lövés automata lövés, a kiszámított készségbónusznak csak a felét add hozzá.
4. Ha a lövés célzott lövés, a kiszámított készségbónusz kétszeresét add hozzá.

A távolsági harci sebzést a következő értékek összege határozza meg:

1. A fegyver távolsági harci sebzésértéke.
2. Adj hozzá egy véletlen tényezőt, amely a kezdeti sebzésérték 50% és 150% közötti sebzésmennyiséget eredményez.
3. Vond le a célpont egység páncélértékét azon az oldalon, amelyen találat éri.
4. Vond le a célpont egység által elfoglalt terep védelmi értékét.

## Fegyvertáblázat

| Fegyver | Súly | Méret | Alkat | AP-költség a térképen | % közelharc költség | % közelharc pontosság | Közelharc sebzés | % közelharc erőbónusz | % közelharc ügyességi bónusz | % automata AP-költség | % automata pontosság | % gyorslövés AP-költség | % gyorslövés pontosság | % célzott AP-költség | % célzott pontosság | % készségtényező | Távolsági sebzési tényező | Lőszerkapacitás | Lőszertípus |
| :-- | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | --: | :-- |
| M4000 Auto-Gun | 10 | 12 | 106 | 2 | 25 | 40 | 8 | 20 | 10 | 3 | 5 | 25 | 16 | 50 | 40 | 8 | 46 | 20 | M4000 Gun-Clip |
| Marsec Auto Gun | 12 | 14 | 116 | 2 | 25 | 38 | 10 | 20 | 9 | 6 | 5 | 25 | 18 | 50 | 45 | 8 | 58 | 20 | Marsec Gun-Clip |
| Sniper Rifle | 7 | 8 | 98 | 1 | 20 | 52 | 8 | 20 | 13 | - | - | 33 | 26 | 67 | 56 | 13 | 52 | 12 | Rifle Clip |
| Marsec Pistol | 6 | 4 | 100 | 0 | 20 | 50 | 6 | 17 | 17 | - | - | 13 | 10 | 25 | 22 | 7 | 40 | 8 | Pistol Clip |
| L50 Las-Gun | 16 | 14 | 120 | 2 | 33 | 34 | 10 | 17 | 10 | 5 | 4 | 20 | 12 | 50 | 24 | 5 | 30 | 40 | L50 Las-Pack |
| Heavy Laser | 28 | 34 | 126 | 3 | 50 | 24 | 11 | 17 | 7 | 3 | 3 | 17 | 10 | 33 | 16 | 6 | 45 | 50 | Heavy Las-Pack |
| Rocket Launcher | 12 | 22 | 86 | 3 | 50 | 26 | 9 | 14 | 8 | - | - | 33 | 10 | 67 | 18 | 5 | 160 | 1 | Rocket |
| Dagger | 1 | 2 | 60 | 0 | 17 | 58 | 20 | 13 | 33 | - | - | - | - | - | - | - | - | - | - |
| AP50 Grenade | 2 | 2 | 60 | 0 | - | - | - | - | - | - | - | - | - | - | - | - | 90 | - | - |
| Explosive | 15 | 8 | 80 | 0 | - | - | - | - | - | - | - | - | - | - | - | - | 70 | - | - |
| M50 Auto Pistol | 5 | 4 | 103 | 0 | 25 | 26 | 5 | 25 | 13 | 10 | 3 | 20 | 12 | 50 | 30 | 5 | 42 | 12 | Pistol Clip |
| L80 Las-Gun | 14 | 18 | 112 | 2 | 25 | 30 | 8 | 17 | 8 | - | - | 25 | 28 | 50 | 64 | 4 | 48 | 10 | L80 Las-Pack |
| Pump Shot Gun | 9 | 9 | 106 | 0 | 25 | 40 | 8 | 20 | 14 | - | - | 25 | 16 | 50 | 38 | 7 | 64 | 6 | Shot Gun Clip |
| MS Auto Cannon | 26 | 30 | 120 | 3 | 33 | 26 | 11 | 17 | 7 | 13 | 8 | 25 | 20 | 50 | 40 | 7 | 78 | 12 | Cannon Clip |
| MK-1 | 14 | 12 | 136 | 1 | 25 | 36 | 8 | 17 | 13 | 8 | 12 | 33 | 24 | 33 | 57 | 10 | 53 | 30 | MK-1 Clip |
| AP75 Grenade | 4 | 3 | 130 | 0 | - | - | - | - | - | - | - | - | - | - | - | - | 160 | - | - |
| Light Sabre | 5 | 4 | 180 | 0 | 20 | 46 | 84 | 17 | 33 | - | - | - | - | - | - | - | - | - | - |

---

# 3. rész: A küldetések

## Első küldetés: The Assassins (A bérgyilkosok)

### Bevezetés

A Marsec vállalat gyártja a galaxis legjobb fegyvereit, de főnöke, Sterner Regnix, tisztességtelen módszerekkel hajtja ki a legjobbat a vezető tudósaiból. Az elmekontroll-szerek és a kibernetikus implantátumok használata elterjedt, de a Marsec hivatalosan tagadja. A Csillagközi Kereskedelmi Szabványügyi Hatóság tehetetlen, nem tud közbelépni. Néhány volt alkalmazott elhatározta, hogy meggyilkolja Sterner Regnixet. Megtalálták magánotthonát a CX-1 bolygón, és nem állnak meg, amíg Sterner halott nem lesz.

### Felállítás

- **Bérgyilkos osztag (Assassin squad):** A ház körüli piros és sárga felállítási mezőkön állj fel. A házba a keleti vagy a nyugati ajtó kinyitásával lehet bejutni.
- **Droid osztag (Droid squad):** Sterner Regnix és harci droidokból álló testőrsége a házon belüli kék mezőkön áll fel.

### Győzelmi feltételek

- **Bérgyilkos osztag:** Ha a bérgyilkosoknak sikerül kiiktatniuk Sterner Regnixet, megnyerik a játékot.
- **Droid osztag:** A droid osztag akkor nyer, ha kiiktatja az összes bérgyilkost, és Sterner Regnix életben marad.

## Második küldetés: Moonbase Assault (Holdbázis-roham)

### Bevezetés

Az Omni vállalat Arid-6 holdbázisa biztonsági információkat tárol a kilences galaxisszektor 30 milliárdos lakosságáról. A kilences szektorban valahol ott van a lázadók csillagrendszere, a hírhedt 'Rebelstar', amely még mindig titok minden ellensége előtt. Az Arid-6 holdbázis azonban eddig a legnagyobb fenyegetést jelenti a lázadókra, mivel egyre több adatot gyűjt a lázadók mozgásáról. Egy kis lázadó csoport áttörte a hold külső védelmét, és készen áll, hogy támadást indítson maga a holdbázis ellen.

### Felállítás

- **Laser Squad:** A holdbázison kívüli piros és sárga mezőkön állj fel. Bejutni csak a légzsilipek kinyitásával lehet.
- **Omni Corp:** A holdbázison belüli bíbor mezőkön állj fel.

### Győzelmi feltételek

- **Laser Squad:** A győzelem biztosításához megfelelő számú Databank és Analyser megsemmisítése szükséges. Egy Databank öt győzelmi pontot ér, egy Analyser kettőt. A Laser Squad akkor nyer, ha 100 győzelmi pontot szerez.
- **Omni Corp:** Az Omni vállalat akkor nyer, ha a teljes Laser Squadot kiiktatják.

## Harmadik küldetés: Rescue from the Mines (Mentőakció a bányákban)

### Bevezetés

Egy rutin lázadó küldetés súlyosan félresikerült. A Metallix vállalat egyik bányatelepén végzett felderítő akció egy lázadó osztag legtöbb tagjának halálát okozta. Azonban nem minden veszett el. Az osztag három tagját bebörtönözték a bánya egyik szintjén, és létfontosságú információval rendelkeznek a bányakomplexumról. Sebtében egy kis osztagot állítottak össze a foglyok kiszabadítására.

### Felállítás

- **Laser Squad:** A térkép bal felső és jobb felső részén lévő piros és sárga mezőkön állj fel.
- **Metallix Corp:** A bányakomplexumon belüli kék mezőkön állj fel.

### Győzelmi feltételek

- **Laser Squad:** A győzelem biztosításához mind a három fogolynak meg kell szöknie. Miután egy foglyot kiszabadítottál a celláiból, vidd egy liftajtóhoz, és lépj be a liftbe a szökéshez.
- **Metallix Corp:** A Metallix vállalat akkor nyer, ha legalább öt lázadót megölnek.

## Negyedik küldetés: The Cyber Hordes (A kiberhordák)

### Bevezetés

Ebben a küldetésben egy kis lázadó csoportnak kell megvédenie egy lázadó bolygóállomást egy birodalmi droid osztag támadásától az Azar nagy bolygón. A bázis hét stabilizátormagot tartalmaz, amelyek megakadályozzák a szeizmikus instabilitást a bolygó vékony kérge alatt. A birodalmi osztagvezetők pontosan feltárták Azar védelmének gyengeségeit, és a magok megsemmisítésére alkalmas osztagot állítottak össze. Ha sikerrel járnak, az egész azari lázadó kolónia léte veszélybe kerül.

### Felállítás

- **Lázadó osztag (Rebel squad):** A lázadóknak a térkép jobb oldalán lévő fő bázisterületen belüli piros mezőkön kell felállniuk.
- **Droid osztag (Droid squad):** A droidoknak a bázis bal felső és bal alsó részén lévő kék felállítási mezőkön kell felállniuk.

### Győzelmi feltételek

- **Lázadó osztag:** Kétjátékos játékban a lázadóknak mind a nyolc droidot ki kell iktatniuk a győzelemhez. Az egyjátékos változatban a droidok erősítést kapnak. A lázadóknak 100 győzelmi pontnyi droidot kell megsemmisíteniük a győzelemhez.
- **Droid osztag:** A droid osztag akkor nyer, ha legalább öt stabilizátormagot megsemmisítenek, vagy ha az egész lázadó osztagot megölik.

## Ötödik küldetés: Paradise Valley (Paradicsom-völgy)

### Bevezetés

A bolygóstabilizátor-bázis megsemmisítése romokban hagyta az azari kolóniát. A vulkánkitörések elpusztították a legtöbb jelentős létesítményt, a birodalmi rohamhajók pedig keselyűkként lebegnek a légkör fölött, és arra várnak, hogy zsákmányuk elpusztuljon. Egy ilyen hatalmas támadásnak egy ilyen kis kolónia ellen csak egyetlen célja lehetett: megtalálni és elfogni a lázadók fejlett csillagvadászának terveit. Ahelyett, hogy minden munkájukat elpusztították volna, a lázadók az összes adatot egy kis biztonsági eszközre vitték át. Egy osztagot bíztak meg azzal, hogy az eszközzel megszökjön a kolóniáról, és elérje a nyugati síkságon lévő vészjelző bójáját. Az út azonban nem könnyű. A Paradicsom-völgyön átvezető útvonal nagyon veszélyes, mert az összes helyi vadon ellenséges és halálos. Egy földalatti alagúthálózat megkönnyítheti az utat, de a bejáratok és kijáratok mind rejtettek. A szektoidok nevű értelmes faj gyűjti és tárolja azokat a fegyvereket, amelyeket a szerencsétlen emberektől vettek el, akikkel találkoztak, és képesek is használni ezeket a fegyvereket. A fenti völgyben a növényzet fedezéket nyújt a gonosz, mérges splurge-oknak, amelyek savas nyála halálos. Csak a legleleményesebb osztagvezető tudna átjutni a Paradicsom-völgyön.

### Felállítás

- **Lázadó osztag:** A lázadóknak a völgy bal oldalán lévő piros és sárga mezőkön kell felállniuk.
- **Idegenek (Aliens):** Az idegeneknek nincs felállítási szakaszuk. Véletlenszerűen kerülnek elhelyezésre természetes környezetükben.

### Győzelmi feltételek

- **Lázadó osztag:** A lázadóknak el kell juttatniuk a biztonsági eszközt, amelyet kezdetben Corporal Hansen hord, a völgy jobb oldalára.
- **Idegenek:** Az idegenek akkor nyernek, ha az összes lázadót megölik.
