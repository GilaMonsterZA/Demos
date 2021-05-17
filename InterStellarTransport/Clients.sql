WITH ClientNames AS (
	SELECT ClientName FROM (
	VALUES
	('340 Dynamics' ),
	('Abongolia Foods' ),
	('Abto Meats' ),
	('Adelphi Group' ),
	('Tan Supplies' ),
	('�akanologies Cybernetics' ),
	('�alis Networks' ),
	('Aegason Deliveries' ),
	('Aegustries' ),
	('Aeriaamissonik Meats' ),
	('Aeriadalekon Arts' ),
	('Aeriafarworths Electronics' ),
	('Aeriaoros Cybernetics' ),
	('Aerroidscape Corporation' ),
	('�thelwulf Networks' ),
	('Athwares Multinational' ),
	('Evasburys' ),
	('Agdania of Soptan' ),
	('Agenellamans' ),
	('Ageran Global' ),
	('Agerebus Ltd' ),
	('Agrippa Cybernetics' ),
	('Agstems Corporation' ),
	('Ahwahnee International' ),
	('Aion Limited' ),
	('Ajax Supplies' ),
	('Akagi CIC' ),
	('Akagi Multinational' ),
	('Akiraity' ),
	('Akiraustries Supplies' ),
	('Alpworth' ),
	('Amlax of Wunorox' ),
	('Amonelerthix Dynamics' ),
	('Amontaniawood' ),
	('Amurdanbank' ),
	('Anatrockscape Ltd' ),
	('Anddyne Corporation' ),
	('Aniza of Ablax' ),
	('Antanellaburys Bionics' ),
	('Antariaods Corporation' ),
	('Antasonic Corporation' ),
	('Antcania Supplies' ),
	('Antco Energy' ),
	('Antdoo' ),
	('Antgolia Logistics' ),
	('Antondyne Aggregates Ltd' ),
	('Anubis Corporation' ),
	('Anubiswares CIC' ),
	('Anutlissonik Multinational' ),
	('Anvanaman' ),
	('Aol of Aropa' ),
	('Apollo Energies' ),
	('Aran Inc' ),
	('Arbongo Food' ),
	('Archer Interstellar' ),
	('Archerfy International' ),
	('Archity Limited' ),
	('Arciru Industries' ),
	('Arclas Energy' ),
	('Argon Acoustics' ),
	('Argonlify Inc' ),
	('Ariacon Co-operative' ),
	('Ariane Corp' ),
	('Arianefy Limited' ),
	('Arianepoint CIC' ),
	('Ariaopia Corporation' ),
	('Arkien of Grenminiar' ),
	('Arkrods' ),
	('Arkwright Limited' ),
	('Armstrong Holdings' ),
	('Arock Systems' ),
	('Arthur Galactic' ),
	('Asimov Corp' ),
	('Astarangoliawarez Bionics' ),
	('Astararaburys Global' ),
	('Astarix LLP' ),
	('Astarlak Applications' ),
	('Astpoint' ),
	('Atan Interplanetary' ),
	('Atar�us Networks' ),
	('Ataropiapoint Meats' ),
	('Atbudramsystems Networks' ),
	('Atconpoint Atomic' ),
	('Athena Solutions' ),
	('Atlantic Industries' ),
	('Atlantis Meats' ),
	('Atongoliazon International' ),
	('Atoroxdyne Multinational' ),
	('Atosebank' ),
	('Atulemans' ),
	('Aturidiancorp Limited' ),
	('At Co-operative' ),
	('Atwood Meats' ),
	('Attainment Logistics' ),
	('AuramCorp Association' ),
	('Automustries Interstellar' ),
	('AUYW Solutions' ),
	('Avarice International' ),
	('Avcania Electronics' ),
	('Aveliusbeat Electrics' ),
	('B�anella Aggregates Ltd' ),
	('Borto Limited' ),
	('Canialife Chemicals' ),
	('Imantales Limited' ),
	('Banavera of Zeropia' ),
	('Baneran of Vivury' ),
	('Banpid Security' ),
	('Banshee Energies' ),
	('Bantongworth' ),
	('Banttep Limited' ),
	('BAQO Corp' ),
	('Baraddon of Amoninax' ),
	('Baropia Association' ),
	('Barracuda Acoustics' ),
	('Barthsonic Bionics' ),
	('Bartose Galactic' ),
	('Bartronia Industrial' ),
	('Bastal Power' ),
	('Bastion Limited' ),
	('Bastion Multinational' ),
	('Bavas Food' ),
	('BDV Center' ),
	('Beagle Food' ),
	('Beagle UTC' ),
	('BECQ' ),
	('Beetle Corporation' ),
	('Beetle Power' ),
	('Beetlestems Supplies' ),
	('Belbank' ),
	('Belbeat' ),
	('Bellerophon Inc' ),
	('Belrods' ),
	('Berlin Applications' ),
	('Berlin Global' ),
	('Berlin Solutions' ),
	('Beta Industrial' ),
	('Betcarisrods Logistics' ),
	('Betsleds Atomic' ),
	('Biddeford Interplanetary' ),
	('Biddeford Networks' ),
	('Bipidco' ),
	('BKT Energy' ),
	('Blackbird CIC' ),
	('Blackburn LLP' ),
	('Blackos Electronics' ),
	('Bolsover Energies' ),
	('Bonamis Association' ),
	('Bononinepoint' ),
	('Bontonia of Inteko' ),
	('Botanosonic' ),
	('Botes of Sot Louram' ),
	('Bouman Applications' ),
	('Bonfoods Limited' ),
	('Bounty International' ),
	('Bountyforce Logistics' ),
	('BQGT' ),
	('Brobongo Limited' ),
	('Bruce Ltd' ),
	('Bruceconn Acoustics' ),
	('Bruceosonic Food' ),
	('Brumorox of Depalis' ),
	('Brumos Electronics' ),
	('Brumtessearch' ),
	('Budix Electrics' ),
	('Burckhardt Interstellar' ),
	('Burtix Supplies' ),
	('Burtonsonik Power' ),
	('Byrd Limited' ),
	('C�acalla Industries' ),
	('C�anosoft' ),
	('C�chia LLP' ),
	('C�eran of Tapshaa' ),
	('C�trock Industries' ),
	('C�utlis Food' ),
	('Caaroid Food' ),
	('Caelius Aggregates Ltd' ),
	('Cairo Logistics' ),
	('Calypsostems Limited' ),
	('Caminha Food' ),
	('Caminha Group' ),
	('Campcan of Sotnia' ),
	('Campchia of Sot Lotes' ),
	('Campitascorp Deliveries' ),
	('Caodamatic Multinational' ),
	('Capodix Global' ),
	('Caroltemic Deliveries' ),
	('Carreria Corp' ),
	('Carrongolia Inc' ),
	('Carropatainment Meats' ),
	('Carropatal Global' ),
	('Caumi Global' ),
	('Cavelife Meats' ),
	('Cavendish Association' ),
	('Ceiza Power' ),
	('Celtic Inc' ),
	('Centaur Power' ),
	('Centaurcorp Corp' ),
	('Centcom Electrics' ),
	('Centenary Atomic' ),
	('Centenary Components' ),
	('Centenary Group' ),
	('Cerlaxworths Components' ),
	('Cetararomics Acoustics' ),
	('Ceti Logistics' ),
	('Cetnology' ),
	('CEX' ),
	('Chamburys Acoustics' ),
	('Charleston Incorporated' ),
	('Charman Chemicals' ),
	('Charmatic Aggregates Ltd' ),
	('Chekov Deliveries' ),
	('Chekov Units' ),
	('Chirikov Food' ),
	('Chiripoint' ),
	('Chuncomms Foods' ),
	('Churella Industrial' ),
	('Churlejoslify Ltd' ),
	('Churtos Inc' ),
	('Churuleods' ),
	('Chyron Chemicals' ),
	('Chyron Galactic' ),
	('Chyron Global' ),
	('Chyronbank Corp' ),
	('Ciella of Thafar' ),
	('Cinia Meats' ),
	('Cizaprises Limited' ),
	('Cloaldi of Darkon' ),
	('Cloalos Acoustics' ),
	('Clobudramsys Food' ),
	('Cloillianwares Association' ),
	('Clotariapoint Industries' ),
	('Cobra Energy' ),
	('Cobrawares Dynamics' ),
	('CochCorp' ),
	('Cochrane Group' ),
	('Cochrane Security' ),
	('Coldakapoint' ),
	('Coldcariscom Energy' ),
	('Coldenella CIC' ),
	('Coldongustries' ),
	('Coldtrock Bionics' ),
	('Coldurn Energy' ),
	('Coleman Co-operative' ),
	('Coleman Meats' ),
	('Coletainment Energy' ),
	('Columix Center' ),
	('Cometprises Chemicals' ),
	('Cometustry Limited' ),
	('CON' ),
	('Concord Arts' ),
	('Concordronics' ),
	('Condor Arts' ),
	('Conti Chemicals' ),
	('Conti Ltd' ),
	('Coperbudramlify Solutions' ),
	('Coperumiity Chemicals' ),
	('Coperurn Atomic' ),
	('Corrchil Industrial' ),
	('Correkoustry Aggregates Ltd' ),
	('Correllalife' ),
	('Corrfall Limited' ),
	('Corrgania Foods' ),
	('Cort�s Electrics' ),
	('Couscom Solutions' ),
	('Crazy Components' ),
	('Crazy Corp' ),
	('Crazy International' ),
	('Crazyfix Holdings' ),
	('Cryogenics Group' ),
	('Cuarthworths' ),
	('Cunhasonic' ),
	('Curprises Food' ),
	('Cutopiais' ),
	('Cuvanagold International' ),
	('Cuza Bionics' ),
	('Cyancom Components' ),
	('Cytonforce Security' ),
	('Daornaniafix Corporation' ),
	('Daornaniasys Units' ),
	('Darkdaleko of Fogornania' ),
	('DDY' ),
	('Deacallacorp Bionics' ),
	('Dealcorp Security' ),
	('Dedikar of Sopaka' ),
	('Deebus Energy' ),
	('Deelerth Arts' ),
	('Deepdonia Bionics' ),
	('Deepgolia Interplanetary' ),
	('Defiance Corporation' ),
	('Defiant Galactic' ),
	('Deflify Corporation' ),
	('Defman' ),
	('Defworth Industries' ),
	('DEG Holdings' ),
	('Deganiasys Interstellar' ),
	('Deilla Meats' ),
	('Delillian UTC' ),
	('Deliverance Incorporated' ),
	('Deliverance Industries' ),
	('Delopia Food' ),
	('Delta Electrics' ),
	('Delta Meats' ),
	('Deltacurity Inc' ),
	('Deltaway' ),
	('Deltaway UTC' ),
	('Deltosoft' ),
	('Demeter Energies' ),
	('Depeaux Power' ),
	('Depland Power' ),
	('Depoxasonic Units' ),
	('Deppidor Cybernetics' ),
	('Deptania Corp' ),
	('Derarniaburys' ),
	('Derlerasoft' ),
	('Derrog of �tronia' ),
	('Destiny Industrial' ),
	('Destiny International' ),
	('Dikarcaniaromics Arts' ),
	('Dikarlaktainment Interplanetary' ),
	('Dikarniarods Electronics' ),
	('Dikarrog Security' ),
	('Discovery Food' ),
	('DLGD' ),
	('Dragon Networks' ),
	('Drake Co-operative' ),
	('Drake Industrial' ),
	('Drakeations Arts' ),
	('Driftasonic Multinational' ),
	('Duler Components' ),
	('Dunloxbeat CIC' ),
	('Duraddones Aggregates Ltd' ),
	('Durankor Incorporated' ),
	('Durgolia Inc' ),
	('Durorox Deliveries' ),
	('DXVY' ),
	('DYY' ),
	('Ealax Networks' ),
	('Earhart Bionics' ),
	('Earhart Incorporated' ),
	('Ebongomedia' ),
	('ECQ Acoustics' ),
	('Ees Center' ),
	('EFQH' ),
	('Elbudria Cybernetics' ),
	('Eleran Meats' ),
	('Ellsromics Chemicals' ),
	('Ellsworth Corporation' ),
	('Ellsworth Security' ),
	('Eltos Global' ),
	('Endcomm Units' ),
	('Enterprise Global' ),
	('Epprises Incorporated' ),
	('Epsleds Meats' ),
	('Equicon Corporation' ),
	('Equicon Logistics' ),
	('Ercania Limited' ),
	('Erebusos' ),
	('Erikson Dynamics' ),
	('Erikson Units' ),
	('Erkbeat Systems' ),
	('Escotide Corp' ),
	('Everest Security' ),
	('EWD' ),
	('Exronics CIC' ),
	('EYJI' ),
	('Farankorustry Corp' ),
	('Farelius of Prourdan' ),
	('Farenheit Industrial' ),
	('Farornania Inc' ),
	('Farprises' ),
	('Fiennes Applications' ),
	('Fiennes Multinational' ),
	('Firebird Solutions' ),
	('Fleming Foods' ),
	('Fogaroid of Intion' ),
	('Fogdai Units' ),
	('Fogitas Inc' ),
	('Fonadon Group' ),
	('Fortsys Chemicals' ),
	('Fortune Corp' ),
	('Fortune Energy' ),
	('Foxcan Ltd' ),
	('Foxera Acoustics' ),
	('Foxfire Center' ),
	('Foxway' ),
	('Fundauctions' ),
	('Funeaux Interplanetary' ),
	('Fungamis of Daeran' ),
	('Fungangolia of Deepelerth' ),
	('Fungania Corporation' ),
	('Fungianason Supplies' ),
	('Fungoloksonik Food' ),
	('Fungorkontides Components' ),
	('Fungshaatide Corporation' ),
	('Fungumronics' ),
	('Funuriaos Cybernetics' ),
	('Furankor of Venion' ),
	('Furera Corporation' ),
	('Gagaods Association' ),
	('Gagarin Deliveries' ),
	('Gagatelligence Ltd' ),
	('Gagtainment' ),
	('Galad�an Units' ),
	('Galadland Center' ),
	('Galadoinsonic Chemicals' ),
	('Galadtarasearch' ),
	('Galadtonsys Arts' ),
	('Galason CIC' ),
	('Galaxyacians LLP' ),
	('Gamma Logistics' ),
	('Gander Incorporated' ),
	('Gantainment LLP' ),
	('Gerlache Ltd' ),
	('Gerwares' ),
	('Getfy Industrial' ),
	('Getnologies Energy' ),
	('Gettysburg Supplies' ),
	('Getustries Components' ),
	('Gibson LLP' ),
	('Gibtemic Deliveries' ),
	('Gibworth Ltd' ),
	('GJVY' ),
	('Gonsonik Cybernetics' ),
	('Gremlin Acoustics' ),
	('Gremwood' ),
	('Grenurrinia Ltd' ),
	('Greyhound Food' ),
	('Greyhound Industries' ),
	('Griffinbank' ),
	('Griffinmotors' ),
	('Grissom Industrial' ),
	('Guerrero Electrics' ),
	('Guntion Food' ),
	('Guntniastems' ),
	('Hades International' ),
	('Hadtainment' ),
	('Hancon Inc' ),
	('Hanlify Networks' ),
	('Hannulify Aggregates Ltd' ),
	('Hannuustry Center' ),
	('Happations' ),
	('Happfix Ltd' ),
	('Harbudram Deliveries' ),
	('Harlequin Limited' ),
	('Havanna Multinational' ),
	('Havanna Units' ),
	('Havustries Inc' ),
	('Hedillianbanks Multinational' ),
	('Hedin Foods' ),
	('Hednt Dynamics' ),
	('Hedshaadoo Security' ),
	('Hedustries Corp' ),
	('Helaleko Co-operative' ),
	('Heldai Holdings' ),
	('Helelerthcurity' ),
	('Hellbound Industrial' ),
	('Hellbound UTC' ),
	('Helonineustries Electrics' ),
	('Helroid Incorporated' ),
	('Heltosprises Logistics' ),
	('Helumconn Inc' ),
	('Hercules Applications' ),
	('Hercules Multinational' ),
	('Hermacians Arts' ),
	('Hermes Corp' ),
	('Hermesnology Center' ),
	('Hermeswood' ),
	('Hermwarez Networks' ),
	('Herowarez' ),
	('Hestainment Electrics' ),
	('Hestia Center' ),
	('Hestia Dynamics' ),
	('Himan Dynamics' ),
	('Himco Co-operative' ),
	('Homotors' ),
	('Honankor Electronics' ),
	('Hondaniais Aggregates Ltd' ),
	('Honfinerustry Corporation' ),
	('Honlejos Power' ),
	('Honnar Networks' ),
	('Honnt Holdings' ),
	('Honoxtide Logistics' ),
	('Hoodcurity Multinational' ),
	('Hoodzon Co-operative' ),
	('Hornes Aggregates Ltd' ),
	('Hornet Bionics' ),
	('Hornet Energy' ),
	('Hornmen' ),
	('Hornods' ),
	('Hubland Multinational' ),
	('Hubumiustries' ),
	('Humsonic Limited' ),
	('Humwarez' ),
	('Hurcomm Arts' ),
	('Hurricane Limited' ),
	('Hypasonic' ),
	('Hypnos Security' ),
	('Hypsearch LLP' ),
	('Ian�am Ltd' ),
	('Ianfar Inc' ),
	('Iannormann' ),
	('Ianvas Atomic' ),
	('Ibaran Chemicals' ),
	('Ibtos Meats' ),
	('Icarus Systems' ),
	('IFX' ),
	('IGJ Energies' ),
	('Ikgold Ltd' ),
	('Ikshanologies' ),
	('Intarthcurity Ltd' ),
	('Intcomms Industries' ),
	('Intillaman Industrial' ),
	('Intius Association' ),
	('Intrepid Food' ),
	('Intrepid Systems' ),
	('Iris Group' ),
	('Irisazon Electrics' ),
	('Ivtaramann Bionics' ),
	('IYZ' ),
	('Janandia UTC' ),
	('Janloktales' ),
	('Janopa Ltd' ),
	('Janudrossoft Interplanetary' ),
	('Javelin Corporation' ),
	('JGA' ),
	('JGWB' ),
	('Kaandalekon Industrial' ),
	('Kaanilla Holdings' ),
	('Kaantusburys Solutions' ),
	('Kasimov Co-operative' ),
	('Kasimov International' ),
	('Kasimov Limited' ),
	('K''curysys Electrics' ),
	('Kelcorp Atomic' ),
	('Kellify Corp' ),
	('Kepalos Inc' ),
	('Kepanbulamann Interstellar' ),
	('Kepoidpoint Arts' ),
	('Keptosenologies Power' ),
	('Kepummen Units' ),
	('K''eran Electronics' ),
	('Ketgatis Bionics' ),
	('Ketion Logistics' ),
	('Ketoroxacians Inc' ),
	('Ketum Applications' ),
	('Keturiaburys Foods' ),
	('Khanaracorp Multinational' ),
	('Khanonineforce' ),
	('Khantaraway' ),
	('Kilations' ),
	('Kingfisher Corp' ),
	('Kingfisher Foods' ),
	('Kingfisher Supplies' ),
	('Kingtainment' ),
	('Klinebussleds Industrial' ),
	('KMIM Limited' ),
	('KMUX Electronics' ),
	('Knedonia International' ),
	('Knegolia Supplies' ),
	('Knelejos Arts' ),
	('Knentostelligence Chemicals' ),
	('Knepodworks Corporation' ),
	('Koacalla Multinational' ),
	('KOE LLP' ),
	('Kolaxscape International' ),
	('Kolchak Interstellar' ),
	('Kolchakco Galactic' ),
	('Kolchakworths' ),
	('Kozlov Dynamics' ),
	('Kozsystems Limited' ),
	('Koztides' ),
	('Krusazon' ),
	('Krusenstern Systems' ),
	('Krustmans Co-operative' ),
	('Kulakov Dynamics' ),
	('Kulakovacians Corp' ),
	('KVZ' ),
	('Kyushu Industries' ),
	('Kyushu Meats' ),
	('Ladaddoncorp Global' ),
	('Ladesh Systems' ),
	('Ladlok Corp' ),
	('LCVZ Multinational' ),
	('Lee Limited' ),
	('Lee Limited' ),
	('Leedscom Inc' ),
	('Leemen Logistics' ),
	('Legchilpoint Aggregates Ltd' ),
	('Legellawares' ),
	('Legongsearch Foods' ),
	('Legopia Security' ),
	('L''era Energy' ),
	('Leviathan Power' ),
	('Lexinglife' ),
	('Lexiscape' ),
	('Lexmedia' ),
	('Leyte Corp' ),
	('Leytetidez' ),
	('LFK' ),
	('Liberty Electronics' ),
	('Libnology Industries' ),
	('Livedoo Electrics' ),
	('Livingsys Incorporated' ),
	('Ll''andia Ltd' ),
	('Loandiasystems Corporation' ),
	('Loania Food' ),
	('Logan Deliveries' ),
	('Loki Multinational' ),
	('Longacan Ltd' ),
	('Longlax of Vulfar' ),
	('Longrax Inc' ),
	('Looid Atomic' ),
	('Lotos International' ),
	('L''rynmen' ),
	('Lucius Bionics' ),
	('Lucius Co-operative' ),
	('Luciusdoo' ),
	('Luciuszon Group' ),
	('L''viz Ltd' ),
	('Magellan UTC' ),
	('Magelprises' ),
	('Majest�am Ltd' ),
	('Majesteustales Corp' ),
	('Mangelpoint Corporation' ),
	('Manoa Chemicals' ),
	('Manoaworth International' ),
	('Mars CIC' ),
	('Maryfix' ),
	('Maryfix UTC' ),
	('Maryland Corp' ),
	('Marylandtide' ),
	('Marymans' ),
	('Matador Units' ),
	('Mendasoft Multinational' ),
	('Mendes Units' ),
	('Menezes CIC' ),
	('Menustries Multinational' ),
	('Mercnt of Avoid' ),
	('Mercury Energy' ),
	('Mercury Galactic' ),
	('Merdonia Inc' ),
	('Merenia of Thanda' ),
	('Merfiner of Vakaddon' ),
	('Merlosuctions Meats' ),
	('Mermaid Co-operative' ),
	('Mermes Components' ),
	('Merox Industries' ),
	('Merrockgold Deliveries' ),
	('Milantidez' ),
	('Millennium Holdings' ),
	('Millenniumsys' ),
	('Millenniumuctions Ltd' ),
	('Miranebus Association' ),
	('Mirannarconn Interplanetary' ),
	('Mirantroniaustry' ),
	('MJWY Meats' ),
	('Morafy Corporation' ),
	('Morasys Food' ),
	('Morrisosoft Inc' ),
	('Mulan Food' ),
	('Mulanmotors Networks' ),
	('Munaleko Multinational' ),
	('Munoros of Betion' ),
	('Muntus Security' ),
	('Murkpaq Supplies' ),
	('Mustang Incorporated' ),
	('MWJS' ),
	('Naddoddur Logistics' ),
	('Naddoddur Ltd' ),
	('Nadfiner Applications' ),
	('Nadix of Trelolok' ),
	('Nadiza Components' ),
	('Nadtania of Klintep' ),
	('Narcaris Solutions' ),
	('Narlakwood' ),
	('Nebcorp' ),
	('Nebuctions Cybernetics' ),
	('Nebulamans' ),
	('Nebularods Energy' ),
	('Nebulon Logistics' ),
	('Nebulon Power' ),
	('NEWD Multinational' ),
	('Nexlife Solutions' ),
	('Nexustales Ltd' ),
	('Nexustides International' ),
	('Nibandia of Steepvana' ),
	('Nibchil Acoustics' ),
	('Niburames' ),
	('Nimcom' ),
	('Nimforce' ),
	('Nimitz Association' ),
	('Nimitz Corporation' ),
	('Nimitz Electronics' ),
	('Nimitzdyne Galactic' ),
	('Nimitznologies Galactic' ),
	('Nina Interplanetary' ),
	('Ningold Dynamics' ),
	('Ninmotors UTC' ),
	('Ninworth Electrics' ),
	('Niraddon Industries' ),
	('Nircan Supplies' ),
	('Nit�an Cybernetics' ),
	('Nittania Systems' ),
	('Nobelosoft Atomic' ),
	('Nobelpaq Inc' ),
	('Nocon Incorporated' ),
	('NOG' ),
	('Non�am Corp' ),
	('Nonaddonromics' ),
	('Nonatoid of Ozdoria' ),
	('Noneauxnology Limited' ),
	('Nonpidorsonic' ),
	('Nonviz of Darknt' ),
	('Noronha Dynamics' ),
	('Noronha Interstellar' ),
	('Noronha Units' ),
	('Northern Center' ),
	('Northern LLP' ),
	('Nostromo LLP' ),
	('Nostromo Networks' ),
	('Novtelligence LLP' ),
	('Nowak Solutions' ),
	('Nowakdoo LLP' ),
	('NQA' ),
	('Obchaniaasoft Center' ),
	('Oberth Galactic' ),
	('Oberth Group' ),
	('Oberth Inc' ),
	('Oberthbeat Atomic' ),
	('Obus of Soniza' ),
	('Odysseycomm Units' ),
	('Odysseysonic' ),
	('OFB International' ),
	('Ogdenfy Deliveries' ),
	('Ogpoint' ),
	('OIR Multinational' ),
	('Olympia Holdings' ),
	('Olympia Industrial' ),
	('Olympic Incorporated' ),
	('Omegworths' ),
	('ORRD Inc' ),
	('OUIJ' ),
	('Outerebusustries' ),
	('Outopia of Ov�am' ),
	('Outthraasoft LLP' ),
	('Outtoniacom Systems' ),
	('Outuswarez Co-operative' ),
	('Ovonine Foods' ),
	('Ovreusason Aggregates Ltd' ),
	('Oxtrock of Fungarnia' ),
	('Oznor of Delfiner' ),
	('Paera Incorporated' ),
	('Paixsleds Solutions' ),
	('Panankorustries' ),
	('Panellaos Networks' ),
	('Pantarabeat' ),
	('Pantheon Center' ),
	('Pantheon Components' ),
	('Pantheon LLP' ),
	('Pantis Systems' ),
	('Panutlisway' ),
	('Paopa Logistics' ),
	('Papangalia Industries' ),
	('Papelerthbeat Industries' ),
	('Papoda Energy' ),
	('Paraforce Galactic' ),
	('Parsearch International' ),
	('Pastcurity Solutions' ),
	('Pasteur Center' ),
	('Pasteur Galactic' ),
	('Pasteur Holdings' ),
	('Pasteur Systems' ),
	('Pataddonustries Power' ),
	('Pataldi LLP' ),
	('Patfalltide Atomic' ),
	('Pathtides Acoustics' ),
	('Pathworks' ),
	('Patornania Inc' ),
	('Paury Limited' ),
	('Pearce Food' ),
	('Pegasus Inc' ),
	('Pegtides Electrics' ),
	('Penlify' ),
	('P�rez Solutions' ),
	('Perseus Center' ),
	('Perseus Multinational' ),
	('Perseus Supplies' ),
	('Pertalla Interstellar' ),
	('Pertgoliaworks Energies' ),
	('Pertlax Inc' ),
	('Pertoxburys Galactic' ),
	('Perttaria of Churrog' ),
	('Phoenix Foods' ),
	('Piclife Ltd' ),
	('Picnology Co-operative' ),
	('Picwarez Energies' ),
	('Pikefy' ),
	('Pikeuctions Group' ),
	('Pinto Acoustics' ),
	('Pinto CIC' ),
	('Pintonologies International' ),
	('Pintoos Security' ),
	('Planazon Ltd' ),
	('PlanCorp Units' ),
	('Planeilla Global' ),
	('Planeitasods' ),
	('Plane-o Interstellar' ),
	('Planeol Incorporated' ),
	('Planetlify' ),
	('Planetworth' ),
	('Planfix' ),
	('Plantales' ),
	('Plingvanaprises Interplanetary' ),
	('Ploeus Logistics' ),
	('Plouridian of Leglok' ),
	('Plualostelligence Bionics' ),
	('Plugilltidez Center' ),
	('Pluinaxways Electronics' ),
	('Plu-o Components' ),
	('Plutocom Chemicals' ),
	('Plutoes Corporation' ),
	('PMF' ),
	('Pontfy Bionics' ),
	('Pooloid Corp' ),
	('Popcurity' ),
	('Popov Logistics' ),
	('Popov Security' ),
	('Popovpoint Components' ),
	('Popovtide' ),
	('Popwarez LLP' ),
	('Porelostides' ),
	('Portep of Shantos' ),
	('Posdoo' ),
	('Poseidon Center' ),
	('Poseidon CIC' ),
	('Poseidon Energy' ),
	('Pranekoprises' ),
	('Pratanways Applications' ),
	('Princeromics' ),
	('Princeton Galactic' ),
	('Proarthsys CIC' ),
	('Prolersys Ltd' ),
	('Prometheus Applications' ),
	('Prometheus Corporation' ),
	('Prometheus Holdings' ),
	('Promworks Interstellar' ),
	('Proviz Systems' ),
	('Proxima Limited' ),
	('Pryconn Meats' ),
	('Pulsar Chemicals' ),
	('Pulsarrods Ltd' ),
	('PXYL' ),
	('PYA' ),
	('QEQN LLP' ),
	('QMIF Holdings' ),
	('QOU Interplanetary' ),
	('QSTL Systems' ),
	('Rampoint Deliveries' ),
	('Ramses Electronics' ),
	('Ramses UTC' ),
	('Razpoint Incorporated' ),
	('RBO Corporation' ),
	('RDV Atomic' ),
	('Relacians Aggregates Ltd' ),
	('Reliant Interstellar' ),
	('Reltales Atomic' ),
	('Remesmatic Acoustics' ),
	('Remlax of Zinglejos' ),
	('Remorkon International' ),
	('Renmotors' ),
	('Rentemic UTC' ),
	('RLPU' ),
	('Robertpaq Group' ),
	('Robprises' ),
	('Robuctions' ),
	('Rockcorp' ),
	('Rockford Supplies' ),
	('Rossacians' ),
	('Rosssys Inc' ),
	('Rosszon LLP' ),
	('Rubicon Dynamics' ),
	('Rubiosonic Deliveries' ),
	('Rubwares Dynamics' ),
	('Rubways' ),
	('Rudanovsky Atomic' ),
	('Rudanovsky Ltd' ),
	('Russtems Power' ),
	('Rustah Logistics' ),
	('Rutronics Units' ),
	('Rytales Dynamics' ),
	('Sabine Deliveries' ),
	('Sabine Systems' ),
	('Sacazon Industrial' ),
	('Sacbank Aggregates Ltd' ),
	('Saieliusity Electronics' ),
	('Saiellatales Solutions' ),
	('Sailos Electronics' ),
	('Saratoga Multinational' ),
	('Sarychev Global' ),
	('Sarychev Limited' ),
	('Sataddon of Perttonia' ),
	('Satcaniasys Limited' ),
	('Satgatis Industrial' ),
	('Satomi Industrial' ),
	('Saturnman Aggregates Ltd' ),
	('Scardikar Applications' ),
	('Schbanks Electronics' ),
	('Schfix Industrial' ),
	('Schouten Acoustics' ),
	('Sciazon Systems' ),
	('Scimitar Group' ),
	('Scimitar LLP' ),
	('Scimitar Logistics' ),
	('Scofy Interplanetary' ),
	('Scoods' ),
	('Scorpio Components' ),
	('Scortemic Co-operative' ),
	('Scott Chemicals' ),
	('Scovill Association' ),
	('Scovill Food' ),
	('S''elos Cybernetics' ),
	('Semeonis Interstellar' ),
	('Senbanks Industrial' ),
	('Sengilldoo Incorporated' ),
	('Senlax Corporation' ),
	('Senrax Multinational' ),
	('Sensoft Interstellar' ),
	('Sentinel Acoustics' ),
	('Sentinel Galactic' ),
	('Sentinel Global' ),
	('Sentoseman Industries' ),
	('Sequeira Interstellar' ),
	('Sequronics' ),
	('Sersystems Multinational' ),
	('Sevalistide Energies' ),
	('Sevdaios Co-operative' ),
	('Severantales Holdings' ),
	('Sevilla Logistics' ),
	('Sevtus Group' ),
	('Sevurriniamatic' ),
	('Shacklify' ),
	('Shackway' ),
	('Shanburto Food' ),
	('Shandakilla of Shandakgill' ),
	('Shandakorkon of Tepchania' ),
	('Shandakzacomm' ),
	('Shanoltal Food' ),
	('Shanopia Units' ),
	('Sidenanellafy Corporation' ),
	('Sidentrock Bionics' ),
	('Silver Association' ),
	('Silver Chemicals' ),
	('Sioux Interplanetary' ),
	('Siouxsonik Limited' ),
	('Sizenaddontidez' ),
	('Sizentaria Interstellar' ),
	('Smurgis Interplanetary' ),
	('SNDK' ),
	('So''andia Industries' ),
	('Sonroid Logistics' ),
	('Soppid Bionics' ),
	('Sot Ank�amsoft Ltd' ),
	('Sot Ankopiagold Aggregates Ltd' ),
	('Sot Ankovin Inc' ),
	('Sot Ankury Electrics' ),
	('Sot Loesh of Janella' ),
	('Sot Loinax Association' ),
	('Sotaddonations Incorporated' ),
	('So''tara Corporation' ),
	('So''thrasearch LLP' ),
	('Sottrocksleds Corporation' ),
	('Sotvis Chemicals' ),
	('So''urriniatelligence' ),
	('So''vana Acoustics' ),
	('SRNV' ),
	('Starason Multinational' ),
	('Starfarer Co-operative' ),
	('Starfarer Electrics' ),
	('Stargazer Acoustics' ),
	('Steepaleko Bionics' ),
	('Steepitastainment Security' ),
	('Stein Applications' ),
	('Steinasonic Food' ),
	('Steinsystems Ltd' ),
	('Strutmotors Electronics' ),
	('Strutt Supplies' ),
	('Sturt Group' ),
	('Suileniatide Security' ),
	('Suilgatisnology' ),
	('Suilion UTC' ),
	('Suiltoity' ),
	('Sulcania Association' ),
	('Sulimanuctions Ltd' ),
	('Sumiuscorp Bionics' ),
	('Sumorox Aggregates Ltd' ),
	('Sumtopiatide Food' ),
	('Sunacan Applications' ),
	('Suntopia Ltd' ),
	('Svaerebus Interstellar' ),
	('Svalon Systems' ),
	('Svaoidwarez' ),
	('SvaurriniaCorp Components' ),
	('Swordes' ),
	('Swordfish Electronics' ),
	('Swordfish International' ),
	('Swordfish Units' ),
	('Tacntos Power' ),
	('Tadlaxzon Industries' ),
	('Tadon of Brumdaleko' ),
	('Tadto Co-operative' ),
	('Tafchil Chemicals' ),
	('Taferia of Jansea' ),
	('Taffallsys Deliveries' ),
	('Taftose Acoustics' ),
	('Tagol Dynamics' ),
	('Taiaddon of Ll''oid' ),
	('Taiamisason' ),
	('Taienia Security' ),
	('Tainicuswares Limited' ),
	('Taiurnwares Interstellar' ),
	('Taltopianologies' ),
	('Tamara Units' ),
	('Tamdaniais' ),
	('Tapariusco Group' ),
	('Tappod Electrics' ),
	('Taroniamans Multinational' ),
	('Tarumosonic Arts' ),
	('Tasenella Ltd' ),
	('Tashornia Corporation' ),
	('Tasnorason UTC' ),
	('Tasule of Jantos' ),
	('Tatzaworks' ),
	('Tavallaconn Chemicals' ),
	('Tavanbulatainment Atomic' ),
	('Tavland Energy' ),
	('Taxacalla Interplanetary' ),
	('Taxbongo Ltd' ),
	('Tepchania Bionics' ),
	('Tepoxason' ),
	('Ter Threpelius CIC' ),
	('Ter Threpfall Corp' ),
	('Ter Threpland Multinational' ),
	('Ter Threpox of Fungopia' ),
	('Terra Chemicals' ),
	('Terra Solutions' ),
	('Terramotors' ),
	('Terraosonic' ),
	('Terrascape' ),
	('Terrasystems' ),
	('TGNO Applications' ),
	('Thaaddon Solutions' ),
	('Thacanmedia' ),
	('Thaminiar Meats' ),
	('Than Dokelialiaronics Center' ),
	('Thanlejosasoft' ),
	('Thanointidez Ltd' ),
	('Thaoidromics Limited' ),
	('Thorfy Interplanetary' ),
	('Thorman' ),
	('Thorsonik' ),
	('Thryella Meats' ),
	('Titan Multinational' ),
	('Titco' ),
	('TNLH Dynamics' ),
	('Tolarth Cybernetics' ),
	('Toldoria Limited' ),
	('Tranis Electronics' ),
	('Trantainment Interstellar' ),
	('Treepixtemic Bionics' ),
	('Treepnttemic Networks' ),
	('Treepuridian Logistics' ),
	('Treepusco' ),
	('Trelacansleds Corporation' ),
	('Treladdonrods Solutions' ),
	('Treladon Power' ),
	('Trelidian Holdings' ),
	('TRFM' ),
	('Tsunami Association' ),
	('Turin LLP' ),
	('TZMG Energies' ),
	('Ulysses Energies' ),
	('Umlas Solutions' ),
	('Unicorn International' ),
	('Uradoo Foods' ),
	('Urafix Industries' ),
	('Uranesco' ),
	('Uranillian of Derchania' ),
	('Urantoniais' ),
	('Urarius Acoustics' ),
	('Urminiarfoods Dynamics' ),
	('UTE Security' ),
	('UVNP Co-operative' ),
	('Vadatoidscape Units' ),
	('Vadeaux of Ataroros' ),
	('Vadiza Components' ),
	('Vadorkonman' ),
	('Vakarius Components' ),
	('Vaknor Galactic' ),
	('Valiant CIC' ),
	('Valiant Supplies' ),
	('Vamaka Applications' ),
	('Vamdaworks Logistics' ),
	('Vamlokworks Industrial' ),
	('Vamnt of Thagatis' ),
	('Vanguard Center' ),
	('Vanguard Power' ),
	('Vasways Chemicals' ),
	('Vengeance Networks' ),
	('Ventcorp Security' ),
	('Venture Cybernetics' ),
	('Venture Inc' ),
	('Venus Inc' ),
	('Venus Inc' ),
	('Venusgold Energies' ),
	('Venzasleds LLP' ),
	('Veravera Center' ),
	('Vercon Industrial' ),
	('VerCorp' ),
	('Verne Dynamics' ),
	('Verne Systems' ),
	('Verods Energies' ),
	('Victal' ),
	('Victoria Food' ),
	('Victoria Multinational' ),
	('Victory Interstellar' ),
	('Victory Networks' ),
	('Vicway' ),
	('Visations Deliveries' ),
	('Vision CIC' ),
	('Vision Electronics' ),
	('Vision Limited' ),
	('Vivangalia of Saiumi' ),
	('Vivtan International' ),
	('VMZW' ),
	('Voltaire Interplanetary' ),
	('Volttelligence Supplies' ),
	('Volttidez' ),
	('Vopcon of Taxlos' ),
	('Vopionosoft Dynamics' ),
	('Vormatic' ),
	('Vormedia' ),
	('Voyacians Multinational' ),
	('Voyager Aggregates Ltd' ),
	('Voyager Power' ),
	('Voyager Units' ),
	('Voyager Units' ),
	('Warangaliaway Arts' ),
	('Warbongomen Arts' ),
	('Warcaristales Dynamics' ),
	('Warchania of Vakenia' ),
	('Wareauxworks Energy' ),
	('Warlejoscorp Security' ),
	('Warlontelligence Applications' ),
	('Waroros Acoustics' ),
	('Warpidor Association' ),
	('Warpidor of Wonangolia' ),
	('Warspite Meats' ),
	('Warutlisrods Foods' ),
	('Wasp Meats' ),
	('Waspsys' ),
	('WDVJ Corporation' ),
	('Welshfy Industries' ),
	('Welshman Security' ),
	('Western Industries' ),
	('Westtemic Components' ),
	('Whatavera Limited' ),
	('Whatol Ltd' ),
	('Whattessleds Incorporated' ),
	('Whattopia Cybernetics' ),
	('Whatvacorp Meats' ),
	('Whimlax Limited' ),
	('Whitestar Limited' ),
	('Wimus Deliveries' ),
	('Winule Meats' ),
	('WJYC' ),
	('Wolvdyne' ),
	('Wolvfoods Networks' ),
	('Wolvosonic' ),
	('Wonbortofoods Ltd' ),
	('Wonchin Energy' ),
	('Woncuryworths' ),
	('Wondalekon Industries' ),
	('Wonestide Corp' ),
	('Woniruustry Power' ),
	('Wonpidforce Systems' ),
	('Wonvas Association' ),
	('Wotep Galactic' ),
	('WUER Corp' ),
	('Wunenellaway' ),
	('Wunkailnology Applications' ),
	('Wunkien Ltd' ),
	('Wunnttidez' ),
	('Wuntropic Limited' ),
	('Wunvasfy' ),
	('Wyvern Acoustics' ),
	('Wyvern Energy' ),
	('Wyvern Industrial' ),
	('Wyvern Limited' ),
	('Wyvern Units' ),
	('X''�ambank Inc' ),
	('X''akascape Center' ),
	('X''conations Co-operative' ),
	('Xe''lox Acoustics' ),
	('Xenelosconn Limited' ),
	('Xenenella Ltd' ),
	('Xenseaco' ),
	('Xenuridannologies Industries' ),
	('Xe''oros Corporation' ),
	('Xeres' ),
	('Xerosonic Solutions' ),
	('Xerworks Limited' ),
	('Xerxes Center' ),
	('Xerxes Logistics' ),
	('XHD Components' ),
	('Xioioncomm Corporation' ),
	('Xiotopia of Anumi' ),
	('Xiotose Units' ),
	('XMDX' ),
	('XPHG' ),
	('XTKG Food' ),
	('XUN' ),
	('XXDN' ),
	('Xycurymedia' ),
	('XZBI Acoustics' ),
	('Yamato Logistics' ),
	('Yamustries Solutions' ),
	('Yamways Ltd' ),
	('Yantar Interstellar' ),
	('Yeaco Inc' ),
	('Yellowstone Center' ),
	('Yellzon Corp' ),
	('Yeti Systems' ),
	('YJC Energy' ),
	('YRFV Inc' ),
	('Yuri Association' ),
	('Zapata Center' ),
	('ZDER Incorporated' ),
	('Zedbongosoft' ),
	('Zedchiatides Interplanetary' ),
	('Zedelerth Foods' ),
	('Zedol Inc' ),
	('Zedurncurity Energies' ),
	('Zemadon Deliveries' ),
	('Zemerantides' ),
	('Zemntos Chemicals' ),
	('Zemorkon Energy' ),
	('Zemum Industrial' ),
	('Zemuridanwood' ),
	('Zengacalla of Verania' ),
	('Zenganbula Deliveries' ),
	('Zengaran Chemicals' ),
	('Zenglos Global' ),
	('Zengoidpoint Industries' ),
	('Zengorox Solutions' ),
	('Zepman' ),
	('Zepsys Cybernetics' ),
	('Zepsystems Arts' ),
	('Zeraddonpoint Association' ),
	('Zeron of Porbudria' ),
	('Zerpidormann' ),
	('Zertos International' ),
	('Zeta Chemicals' ),
	('Zetprises Aggregates Ltd' ),
	('ZGO' ),
	('Zhukov Industrial' ),
	('Zhukov LLP' ),
	('Zingellawood' ),
	('Zingovin CIC' ),
	('Zington Supplies' )) Clients(ClientName)
)
INSERT INTO dbo.Clients (LegalName, HeadquarterSystemID, HypernetAddress)
SELECT 
	ClientName,
	1,
	RIGHT('00' + CAST(FLOOR(RAND(CHECKSUM(NEWID()))*512) AS VARCHAR(5)), 3) + '.' + RIGHT('00' + CAST(FLOOR(RAND(CHECKSUM(NEWID()))*512) AS VARCHAR(5)), 3) + '.' + RIGHT('00' + CAST(FLOOR(RAND(CHECKSUM(NEWID()))*512) AS VARCHAR(5)), 3) + '.' + RIGHT('00' + CAST(FLOOR(RAND(CHECKSUM(NEWID()))*512) AS VARCHAR(5)), 3) + '.' + RIGHT('00' + CAST(FLOOR(RAND(CHECKSUM(NEWID()))*512) AS VARCHAR(5)), 3) AS HyperNetAddress
	FROM ClientNames


-- update some HQ systems

UPDATE dbo.Clients
	SET HeadquarterSystemID = 2
	WHERE ClientID IN (SELECT TOP (15) PERCENT ClientID FROM dbo.Clients WHERE HeadquarterSystemID = 1 ORDER BY NEWID())

UPDATE dbo.Clients
	SET HeadquarterSystemID = 17
	WHERE ClientID IN (SELECT TOP (12) PERCENT ClientID FROM dbo.Clients WHERE HeadquarterSystemID = 1 ORDER BY NEWID())

UPDATE dbo.Clients
	SET HeadquarterSystemID = 6
	WHERE ClientID IN (SELECT TOP (9) PERCENT ClientID FROM dbo.Clients WHERE HeadquarterSystemID = 1 ORDER BY NEWID())

UPDATE dbo.Clients
	SET HeadquarterSystemID = 8
	WHERE ClientID IN (SELECT TOP (7) PERCENT ClientID FROM dbo.Clients WHERE HeadquarterSystemID = 1 ORDER BY NEWID())

UPDATE dbo.Clients
	SET HeadquarterSystemID = 9
	WHERE ClientID IN (SELECT TOP (5) PERCENT ClientID FROM dbo.Clients WHERE HeadquarterSystemID = 1 ORDER BY NEWID())

UPDATE dbo.Clients
	SET HeadquarterSystemID = 3
	WHERE ClientID IN (SELECT TOP (3) PERCENT ClientID FROM dbo.Clients WHERE HeadquarterSystemID = 1 ORDER BY NEWID())

