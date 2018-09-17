-- DROP TABLE bill;
-- DROP TABLE payment;
-- DROP TABLE order_line;
-- DROP TABLE placed_order;
-- DROP TABLE product_detail;
-- DROP TABLE category_detail;
-- DROP TABLE product;
-- DROP TABLE category
-- DROP TABLE languages
-- DROP TABLE administrator;
-- DROP TABLE customer;

--(1)#####################################################################################

CREATE TABLE customer
(
	email VARCHAR2(50),
	first_name VARCHAR2(50) NOT NULL,
	last_name VARCHAR2(50) NOT NULL,
	password VARCHAR2(20) NOT NULL,
	address VARCHAR2(200) NOT NULL,
	CONSTRAINT email_customer_pk PRIMARY KEY (email)
);

INSERT INTO customer VALUES('amine', 'Mohammed El Amine', 'Ghodbane', '123', '77-7777 rue papineau Montréal Quebec H2E 1W6');
INSERT INTO customer VALUES('alex', 'Alex', 'Touli', '789', '22-2222 rue Saint-Java Candiac Quebec K1G 2X8');

--(2)#####################################################################################

CREATE TABLE administrator
(
	admin_code VARCHAR2(20),
	first_name VARCHAR2(50) NOT NULL,
	last_name VARCHAR2(50) NOT NULL,
	password VARCHAR2(20) NOT NULL,
	CONSTRAINT admin_code_administrator_pk PRIMARY KEY (admin_code)
);

INSERT INTO administrator VALUES('admin','Admin','Admin','456');

--(3)#####################################################################################

CREATE TABLE languages
(
    language_code VARCHAR2(3),
    language_name VARCHAR2(100) NOT NULL,
	language_image	VARCHAR2 (100) NOT NULL,
    CONSTRAINT language_code_languages_pk PRIMARY KEY (language_code)	
);

INSERT INTO languages VALUES('EN', 'English', 'images/united-kingdom-language-flag.png');
INSERT INTO languages VALUES('FR', 'Français', 'images/fransh-language-flag.png');

--(4)#####################################################################################

CREATE TABLE category
(
    category_code VARCHAR2(3),
	category_image	VARCHAR2 (100) NOT NULL,
    CONSTRAINT category_code_category_pk PRIMARY KEY (category_code)	
);

INSERT INTO category VALUES('FNS', 'images/FNS.png');
INSERT INTO category VALUES('MSK', 'images/MSK.png');
INSERT INTO category VALUES('SNK', 'images/SNK.png');
INSERT INTO category VALUES('CMP', 'images/CMP.png');
INSERT INTO category VALUES('BYC', 'images/BYC.png');
INSERT INTO category VALUES('WET', 'images/WET.png');
INSERT INTO category VALUES('TNK', 'images/TNK.png');

--(5)#####################################################################################

CREATE TABLE product
(
  sku INTEGER,
  name VARCHAR2(100) NOT NULL,
  brand VARCHAR2(50) NOT NULL,
  category_code VARCHAR2(3) NOT NULL, 
  price NUMBER(6,2) NOT NULL,
  quantity INTEGER NOT NULL,
  image VARCHAR2(100) NOT NULL,  
  CONSTRAINT sku_product_pk PRIMARY KEY (sku),
  CONSTRAINT category_code_product_fk FOREIGN KEY (category_code)
    REFERENCES category (category_code)
);
--FINS
INSERT INTO product VALUES(1, 'Avanti Quattro Plus', 'Mares','FNS', 129.95, 50, 'images/FIMAAQ.jpg');
INSERT INTO product VALUES(2, 'Pro Light', 'Cressi', 'FNS', 62.95, 50, 'images/FICRPL.jpg');
INSERT INTO product VALUES(3, 'Seawing Nova', 'Scuba Pro', 'FNS', 215.00, 50, 'images/FISPSN.jpg');
INSERT INTO product VALUES(4, 'Split Fins Pro', 'Atomic Aquatics', 'FNS', 209.95, 50, 'images/FIAASF.jpg');
INSERT INTO product VALUES(5, 'X-Pert Zoom Z3', 'TUSA', 'FNS', 128.95, 50, 'images/FITUXPZZ.jpg');
INSERT INTO product VALUES(6, 'Manta Ray', 'Oceanic', 'FNS', 199.95, 50, 'images/FIOSMR.jpg');

--MASKS
INSERT INTO product VALUES(7, 'Eyes Evolution Crystal', 'Cressi', 'MSK', 79.95, 50, 'images/MSCREEC.jpg');
INSERT INTO product VALUES(8, 'Frameless 2', 'Atomic Aquatics', 'MSK', 109.95, 50, 'images/MSAAFM.jpg');
INSERT INTO product VALUES(9, 'Frameless II', 'Blue Reef', 'MSK', 89.99, 50, 'images/MSBRFM.jpg');
INSERT INTO product VALUES(10, 'Shadow', 'Oceanic', 'MSK',79.95, 50, 'images/MSOCSH.jpg');
INSERT INTO product VALUES(11, 'LVX', 'Genesis', 'MSK',45.00, 50, 'images/MSGELVX.jpg');
INSERT INTO product VALUES(12, 'Freedom One', 'TUSA', 'MSK', 89.00, 50, 'images/MSTUFR.jpg');

--SNORKELS
INSERT INTO product VALUES(13, 'Supernova', 'Cressi', 'SNK', 19.95, 50, 'images/SNCRSD.jpg');
INSERT INTO product VALUES(14, 'Impulse 3', 'Aqua Lung', 'SNK', 49.50, 50, 'images/SNALI3.jpg');
INSERT INTO product VALUES(15, 'Platina II', 'TUSA', 'SNK', 26.95, 50, 'images/SNTUPIIH.jpg');
INSERT INTO product VALUES(16, 'Mojave', 'Genesis', 'SNK', 31.50, 50, 'images/SNGEMD.jpg');
INSERT INTO product VALUES(17, 'Ergo', 'Mares', 'SNK', 45.00, 50, 'images/SNMAED.jpg');
INSERT INTO product VALUES(18, 'SV2', 'Atomic Aquatics', 'SNK', 67.95, 50, 'images/SNAASD.jpg');
INSERT INTO product VALUES(19, 'Free Diving', 'Blue Reef', 'SNK', 17.95, 50, 'images/SNBRFD.jpg');
INSERT INTO product VALUES(20, 'Spectra Dry', 'Scuba Pro', 'SNK', 60.00 , 50, 'images/SNSPSP.jpg');

--COMPUTER
INSERT INTO product VALUES(21, 'Puck Pro', 'Mares', 'CMP', 194.95, 50, 'images/CMMAPP.jpg');
INSERT INTO product VALUES(22, 'Leonardo', 'Cressi', 'CMP', 249.95, 50, 'images/CMCRLE.jpg');
INSERT INTO product VALUES(23, 'Zoop Novo', 'Suunto', 'CMP', 329.95, 50, 'images/CMSUZN.jpg');
INSERT INTO product VALUES(24, 'i300', 'Aqua Lung', 'CMP', 299.00, 50, 'images/CMALI300.jpg');
INSERT INTO product VALUES(25, 'Pro-Plus 3', 'Oceanic', 'CMP', 729.95, 50, 'images/CMOSPP3.jpg');
INSERT INTO product VALUES(26, 'ReSource Pro', 'Genesis', 'CMP', 472.50, 50, 'images/CMGERP.jpg');

--BYC
INSERT INTO product VALUES(27, 'Avid CQR 3', 'Sherwood', 'BYC', 588.00, 50, 'images/BCSHAC3.jpg');
INSERT INTO product VALUES(28, 'Pure SLS', 'Mares', 'BYC', 460.00, 50, 'images/BCMAPS.jpg');
INSERT INTO product VALUES(29, 'Covert', 'Zeagle', 'BYC', 349.95, 50, 'images/BCZECO.jpg');


--WETSUIT
INSERT INTO product VALUES(30, 'Steamer', 'Scubapro', 'WET', 174.95, 50, 'images/WSSPPS.jpg');
INSERT INTO product VALUES(31, 'Thermoprene Pro', 'Henderson', 'WET', 493.95, 50, 'images/WSHETP.jpg');
INSERT INTO product VALUES(32, 'Ultra Velocity', 'Bare', 'WET', 539.95, 50, 'images/WSBAUV.jpg');
INSERT INTO product VALUES(33, 'Reactor II', 'O''Neill', 'WET', 104.95, 50, 'images/WSONR2.jpg');

--TANK
INSERT INTO product VALUES(34, '80 Cubic Foot', 'Catalina', 'TNK', 219.95, 50, 'images/TVCA80CF.jpg');
INSERT INTO product VALUES(35, ' High Pressure', 'XS Scuba', 'TNK', 314.95, 50, 'images/TVSFHP.jpg');
INSERT INTO product VALUES(36, 'Aluminum Pony', 'Luxfer', 'TNK', 124.95, 50, 'images/TVLUPT.jpg');
INSERT INTO product VALUES(37, '3000 3.0 Kit', 'Spare-Air', 'TNK', 330.00, 50, 'images/TVSA3000.jpg');

--(6)#####################################################################################

CREATE TABLE category_detail (
	category_name	VARCHAR2 (50) NOT NULL,
	about VARCHAR2(1000),
	category_code VARCHAR2(3) NOT NULL,
	language_code VARCHAR2(3) NOT NULL,
	CONSTRAINT catcode_langcode_catdetail_pk PRIMARY KEY (category_code,language_code),
	CONSTRAINT cat_code_cat_detail_fk FOREIGN KEY (category_code)
		REFERENCES category (category_code),
	CONSTRAINT lang_code_cat_detail_fk FOREIGN KEY (language_code)
		REFERENCES languages (language_code)
);

INSERT INTO category_detail VALUES ('Fins', '', 'FNS', 'EN');
INSERT INTO category_detail VALUES ('Palmes', '', 'FNS', 'FR');
INSERT INTO category_detail VALUES ('Masks', '', 'MSK', 'EN');
INSERT INTO category_detail VALUES ('Masques', '', 'MSK', 'FR');
INSERT INTO category_detail VALUES ('Snorkels', '', 'SNK', 'EN');
INSERT INTO category_detail VALUES ('Tubas', '', 'SNK', 'FR');
INSERT INTO category_detail VALUES ('Computers', '', 'CMP', 'EN');
INSERT INTO category_detail VALUES ('Ordinateur', '', 'CMP', 'FR');
INSERT INTO category_detail VALUES ('Buoyancy Compensators', '', 'BYC', 'EN');
INSERT INTO category_detail VALUES ('Gilets de plongée', '', 'BYC', 'FR');
INSERT INTO category_detail VALUES ('Wetsuits', '', 'WET', 'EN');
INSERT INTO category_detail VALUES ('Combinaison', '', 'WET', 'FR');
INSERT INTO category_detail VALUES ('Tanks & Valves', '', 'TNK', 'EN');
INSERT INTO category_detail VALUES ('Bouteilles et détendeurs', '', 'TNK', 'FR');

--(7)#####################################################################################

CREATE TABLE product_detail
(
  sku INTEGER,
  language_code VARCHAR2(3),
  key_features VARCHAR2(1000),
  about VARCHAR2(4000),
  features VARCHAR2(4000),
  CONSTRAINT sku_lang_code_proddetail_pk PRIMARY KEY (sku,language_code),
  CONSTRAINT sku_product_detail_fk FOREIGN KEY (sku)
    REFERENCES product (sku),
  CONSTRAINT langcode_proddetail_fk FOREIGN KEY (language_code)
    REFERENCES languages (language_code)
);

INSERT INTO product_detail VALUES(
	1,
	'EN',
	'<ul class="checkmark"><li>Composite materials optimize efficiency</li>
	<li>Channel Thrust technology for optimum power</li>
	<li>Foot pocket adds thrust with less fatigue</li>
	<li>Equipped with durable bungee straps</li>
	<li>Designed for optimum responsiveness</li></ul>',
	'<p class="text-justify">The Avanti Quattro Plus non-vented fin exceeds the established performance of the traditional model thanks to the use of composite materials Tecralene, Thermoplastic Rubber that optimize efficiency. The Avanti Quattro Plus provide greater responsiveness and thrusting power with an even more attractive look. New bungee straps are provided as standard issue. Straps are equipped with large grasp-loops for easy donning and doffing. Proven Channel Thrust Technology makes the fin versatile and ideal in all diving conditions.</p>
	<p class="text-justify">The stabilizers improve stability and eliminating ankle twisting phenomena. The anatomical foot pocket conveys more power to the blade. Mares design is inspired by marine mammals. Channel thrust technology maximizes the channeling of water and moves a much greater amount of water compared to other fins of the same size. The result is greater thrusting power with the same amount of effort. Fin is available in multiple sizes and colors. Fin blade measures 15" (38 cm), and weighs 31.75 oz. (900 g) in regular size.</p>',
	'<ul class="indent-disc"><li>Non-Vented Fin</li>
	<li>Exceed the Established Performance of Traditional Model</li>
	<li>New Composite Materials, Optimize Efficiency</li>
	<li>Tecralene, Thermoplastic Rubber</li>
	<li>Greater Responsiveness and Thrusting Power</li>
	<li>More Attractive Look</li>
	<li>New Bungee Straps, Standard Issue</li>
	<li>Straps Equipped with Large Grasp-Loops for Easy Donning and Doffing</li>
	<li>Proven Channel Thrust Technology</li>
	<li>Versatile and Ideal in All Diving Conditions</li>
	<li>Stabilizers Improve Stability and Eliminating Ankle Twisting Phenomena</li>
	<li>Anatomical Foot Pocket Conveys More Power to Blade</li>
	<li>Design is Inspired by Marine Mammals</li>
	<li>Channel Thrust Technology Maximizes the Channeling of Water</li>
	<li>Fin Moves a Greater Amount of Water than Fins of Same Size</li>
	<li>Greater Thrusting Power with Same Effort</li>
	<li>Blade Length: 15" (38 cm)</li>
	<li>Weights: 31.75 oz. (900 g)</li>
	<li>Note: Length and Weight Size Regular</li>
	<li>Available in Multiple Sizes and Colors</li></ul>'
);

INSERT INTO product_detail VALUES(
	1,
	'FR',
	'<ul class="checkmark"><li>Les matériaux composites optimisent l''efficacité</li>
	<li>Technologie Thrust Channel pour une puissance optimale</li>
	<li>La poche de pied ajoute une poussée avec moins de fatigue</li>
	<li>Équipé de sangles élastiques durables</li>
	<li>Conçu pour une réactivité optimale</li> </ul>',
	'<p class="text-justify">La palme non ventilé Avanti Quattro Plus dépasse les performances établies du modèle traditionnel grâce à l''utilisation de matériaux composites Tecralene, caoutchouc thermoplastique qui optimisent l''efficacité. L''Avanti Quattro Plus offre une plus grande réactivité et une puissance de poussée encore plus attrayante. De nouvelles sangles élastiques sont fournies en série. Les courroies sont équipées de larges boucles de préhension pour un enfilage et un retrait faciles. La technologie éprouvée de poussée du canal rend la dérive polyvalente et idéale dans toutes les conditions de plongée.</p>
 	<p class="text-justify">Les stabilisateurs améliorent la stabilité et éliminent les phénomènes de torsion de la cheville. La poche anatomique confère plus de puissance à la lame. Le design de Mares est inspiré des mammifères marins. La technologie de poussée des chenilles maximise la canalisation de l''eau et déplace une quantité d''eau beaucoup plus grande par rapport aux autres palmes de même taille. Le résultat est une plus grande puissance de poussée avec le même effort. La lame d''aileron mesure 15 po (38 cm) et pèse 31,75 oz (900 g) en taille normale.</p>',
	'<ul class="indent-disc"><li>Aileron non ventilé</li>
	<li>Dépasser la performance établie du modèle traditionnel</li>
	<li>Nouveaux matériaux composites, optimisation de l''efficacité</li>
	<li>Tecralene, Caoutchouc thermoplastique</li>
	<li>Plus grande réactivité et puissance de poussée</li>
	<li>Allure plus attrayant</li>
	<li>Nouvelles sangles élastiques, numéro standard</li>
	<li>Courroies équipées de grandes boucles de préhension pour faciliter la mise en place et le retrait</li>
	<li>Technologie éprouvée de poussée des canaux</li>
	<li>Polyvalent et idéal dans toutes les conditions de plongée</li>
	<li>Les stabilisants améliorent la stabilité et éliminent les phénomènes de torsion de la cheville</li>
	<li>La poche anatomique offre plus de puissance à la lame</li>
	<li>Le design est inspiré par les mammifères marins</li>
	<li>La technologie Channel Thrust maximise la canalisation de l''eau</li>
	<li>La palme déplace une plus grande quantité d''eau que les palmes de même taille</li>
	<li>Puissance de poussée supérieure avec le même effort</li>
	<li>Longueur de lame: 15 "(38 cm)</li>
	<li>Poids: 31,75 oz (900 g)</li>
	<li>Note: Longueur et poids Taille Régulier</li>
	<li>Disponible en plusieurs tailles et couleurs</li></ul>'
);

INSERT INTO product_detail VALUES(
	2,
	'EN',
	'<ul class="checkmark"><li>Polypropylene blade provides a variable flex</li>
	<li>Fin design adjusts during the kicking cycle</li>
	<li>Flexible and requires less kicking effort</li>
	<li>20% increase in useful surface area</li>
	<li>Unique foot pocket keeps feet secure</li></ul>',
	'<p class="text-justify">Pro Light is more powerful, and is easy to use than any fin on the market. The unique polypropylene blade material provides a variable flex that adjusts during the kicking cycle. The blade is extremely flexible and has snap requiring less kicking effort. The side stringers that extend all along the blade and two flaps situated along the end of the blade itself make the fin very directional.</p>
	<p class="text-justify">Cressi-sub was the first company to recognize the performance value of the foot pocket. The Pro Light''s foot pocket is made of a comfortable elastomer material and is computer designed to give ideal transmission of leg-fin thrust the blade becomes a true extension of your leg. The blade originates from the upper part of the foot pocket, with a 20% increase in useful surface area compared to a traditional fin of the same length. The unique foot pocket design keeps the diver''s heel from extending over the end of the foot pocket. This transfers the kicking load to the diver''s heel, rather than the middle of the foot and eliminates foot fatigue and cramping. Pro light''s foot pocket is extra wide with soft expansion sides for extreme comfort. Fin is equipped with impact and corrosion resistant quick-release buckles with quality rubber straps.</p>
	<p class="text-justify">These high-performance features are packaged in a fin that weighs 35% less than conventional fins. Pro Light out maneuvers split fin technology, is as attractive as it is effective and costs less than most of the diving fins on the market. The Pro Light is ideal for all levels of experience. Fins are available in multiple sizes and colors.</p>',
	'<ul class="indent-disc"><li>Ultra-Lightweight and Reactive Blade</li>
	<li>Strong Polypropylene Blade Material</li>
	<li>Soft Comfortable Elastomer Rubber Foot Pocket</li>
	<li>Computer Designed Foot Pocket</li>
	<li>Blade Originates from Upper Part of Foot Pocket</li>
	<li><b>Foot Pocket/Blade:</b><ul class="indent-none">
	<li>20% Increase of Blade Surface Area</li>
	<li>35% Less-Weight than Conventional Fins</li></ul></li>
	<li>Impact and Corrosion Resistant Quick-Release Buckles</li>
	<li>Quality Rubber Straps</li>
	<li>Ideal for All Levels of Experience</li></ul>'
);

INSERT INTO product_detail VALUES(
	2,
	'FR',
	'<ul class="checkmark"><li>La lame en polypropylène fournit une flexibilité variable</li>
	<li>La conception des ailerons s’ajuste pendant le cycle de coups de pied</li>
	<li>Flexible et nécessite moins d''effort de</li>
	<li>20% d''augmentation de la surface utile</li>
	<li>Une poche unique maintient les pieds en sécurité</li></ul>',
	'<p class="text-justify">Pro Light est plus puissant et facile à utiliser que n''importe quelle palme du marché. Le matériau de lame en polypropylène unique offre un flex variable qui se règle pendant le cycle de battement. La lame est extrêmement flexible et dispose d''un bouton-pression nécessitant moins d''efforts de frappe. Les limons latéraux qui s''étendent le long de la lame et deux volets situés à l''extrémité de la lame rendent la palme très directionnelle.</p>
	<p class="text-justify">Cressi-sub a été la première entreprise à reconnaître la valeur de performance de la poche de pied. La poche de pied Pro Light est fabriquée dans un matériau élastomère confortable et est conçue par ordinateur pour une transmission idéale de la poussée des jambes et des palmes. La lame devient alors une véritable extension de votre jambe. La lame provient de la partie supérieure de la poche du pied, avec une augmentation de 20% de la surface utile par rapport à une ailette traditionnelle de même longueur. La conception unique de la poche du pied empêche le plongeur de s''étendre au bout de la poche du pied. Cela transfère le poids des coups de pied au talon du plongeur plutôt qu''au milieu du pied et élimine la fatigue et les crampes du pied. La poche de pied Pro light est extra large avec des côtés souples pour un confort extrême. Fin est équipé de boucles à dégagement rapide résistant aux chocs et à la corrosion avec des sangles en caoutchouc de qualité.</p>
	<p class="text-justify">Ces caractéristiques de haute performance sont emballées dans un aileron qui pèse 35% de moins que les ailerons conventionnels. La technologie Pro Light out Manœuvrant la technologie des ailettes est aussi attrayante qu''efficace et coûte moins cher que la plupart des palmes de plongée sur le marché. Le Pro Light est idéal pour tous les niveaux d''expérience. Les palmes sont disponibles en plusieurs tailles et couleurs.</p>',
	'<ul class="indent-disc"><li>Lame ultra légère et réactive</li>
	<li>Matériel de lame en polypropylène solide</li>
	<li>Poche en caoutchouc souple et confortable en élastomère</li>
	<li>Poche à pied conçue par ordinateur</li>
	<li>La lame provient de la partie supérieure de la poche de pied</li>
	<li><b>Poche / lame de pied:</b><ul class="indent-none">
	<li>Augmentation de 20% de la surface de la lame</li>
	<li>35% moins de poids que les palmes conventionnelles</li></ul></li>
	<li>Boucles à libération rapide résistantes à l''impact et à la corrosion</li>
	<li>Sangles De Caoutchouc De Qualité</li>
	<li>Idéal pour tous les niveaux d''expérience</li></ul>'
);

INSERT INTO product_detail VALUES(
	3,
	'EN',
	'<ul class="checkmark"><li>Articulated midpoint joint for optimum thrust</li>
	<li>Super ergonomic foot pocket</li>
	<li>Upward directed wing tips for stability</li></ul>',
	'<p class="text-justify">If you are the type of diver who wants cutting edge technology with you at depth, look no further that the Scubapro Seawing Nova Fins. This fin comes with the security of the Scubapro name with the thrill of Scubapro innovation. The Seawing Nova combines classic Scubapro fin technology with the latest innovations in hydrodynamic design and cutting edge materials. This fin has the power, acceleration and maneuverability of a paddle fin with the comfort, efficiency and effortless speed of split fins.</p>
	<p class="text-justify">The Seawing Nova brags of having an articulated joint, which will propel you through the water with ease, speed, agility, and amazing comfort. What makes the Seawing Nova so amazing? First, it has variable blade geometry; second, it has an articulated joint. What is an articulated joint? Think about how a dolphin''s tail moves as it swims; the natural structure of the tail bends as if it is on a hinge and provides the dolphin with remarkable power. The same science was applied during the development of the Seawing Nova. The variable blade geometry brings us back to the dolphin. As a dolphin''s tail moves upward, the tips bend down a bit to make it more streamlined. The Seawing Nova''s edges do the same thing as the diver''s kick is on the upward swing. As the foot moves downward, the fin flattens out to create an amazing amount of power and thrust. The articulated joint allows the blade to pivot and the entire blade is able to generate thrust. Pivot control technology ensures the most efficient angle of attack is maintained no matter how hard or softly you kick, generating thrust without drag or wasted energy.</p>',
	'<ul class="indent-disc"><li>Cutting Edge Technology</li>
	<li>Variable Blade Geometry</li>
	<li>Articulated Mid-Point Joint Like Dolphin''s Tail</li>
	<li>Remarkable Power Design</li>
	<li>Propel Thru-Water with Ease, Speed, Agility, and Amazing Comfort</li>
	<li>Amazing Amount of Power and Thrust</li>
	<li>ERGO2 Super-Ergonomic Foot Pocket</li>
	<li>High-Tech Elastomer Construction</li>
	<li>Marine-Quality Bungee Heel Strap</li>
	<li>Variable Pivot Control Ribs for Most Efficient Angle of Attack</li>
	<li>Wing Tips Arc Upwards, Increasing High-Speed Stability</li>
	<li>Classic SCUBAPRO Fin Technology with Latest Innovations in Hydrodynamic Design</li>
	<li>Available in Multiple Sizes</li></ul>'
);

INSERT INTO product_detail VALUES(
	3,
	'FR',
	'<ul class="checkmark"><li>Articulation du point médian articulé pour une poussée optimale</li>
	<li>Poche de pied super ergonomique</li>
	<li>Des bouts d''aile dirigés vers le haut pour la stabilité</li></ul>',
	'<p class="text-justify">Si vous êtes le type de plongeur qui souhaite une technologie de pointe avec vous en profondeur, ne cherchez pas plus loin que les palmes Scubapro Seawing Nova. Cette aileron vient avec la sécurité du nom Scubapro avec le frisson de l''innovation Scubapro. Le Seawing Nova combine la technologie classique des palmes Scubapro avec les dernières innovations en matière de conception hydrodynamique et de matériaux de pointe. Cette aileron a la puissance, l’accélération et la maniabilité d’un aileron avec le confort, l’efficacité et la vitesse sans effort des ailerons fendus.</P>
	<p class="text-justify">Le Seawing Nova se vante d''avoir un joint articulé qui vous propulse dans l''eau avec facilité, rapidité, agilité et un confort incroyable. Qu''est-ce qui rend le Seawing Nova si incroyable? Tout d''abord, il a une géométrie de lame variable; Deuxièmement, il a un joint articulé. Qu''est-ce qu''un joint articulé? Pensez à la façon dont la queue d''un dauphin bouge pendant qu''il nage; la structure naturelle de la queue se plie comme si elle se trouvait sur une charnière et fournit au dauphin une puissance remarquable. La même science a été appliquée lors du développement de la Seawing Nova. La géométrie variable de la lame nous ramène au dauphin. Au fur et à mesure que la queue d''un dauphin monte, les pointes se plient un peu pour le rendre plus aérodynamique. Les bords du Seawing Nova font la même chose que le coup de pied du plongeur lors de la montée. À mesure que le pied descend, l''aileron s''aplatit pour créer une puissance et une poussée incroyables. Le joint articulé permet à la lame de pivoter et la lame entière peut générer une poussée. La technologie de contrôle du pivot permet de maintenir l''angle d''attaque le plus efficace, quelle que soit la force avec laquelle vous frappez, générant une poussée sans traînée ni perte d''énergie.</P>',
	'<ul class="indent-disc"><li>Technologie de pointe</li>
	<li>Géométrie à lame variable</li>
	<li>Articulation mi-point articulée comme la queue du dauphin</li>
	<li>Conception de puissance remarquable</li>
	<li>Propulser l''eau à travers l''eau avec facilité, rapidité, agilité et confort incroyable</li>
	<li>Quantité incroyable de puissance et de poussée</li>
	<li>Poche plantaire ergonomique ERGO2</li>
	<li>Construction en élastomère de haute technologie</li>
	<li>Sangle à talon élastique de qualité marine</li>
	<li>Côtes de contrôle de pivot variable pour l’angle d’attaque le plus efficace</li>
	<li>Astuces d''aile vers le haut, augmentant la stabilité à haute vitesse</li>
	<li>Technologie de finition SCUBAPRO classique avec les dernières innovations en matière de conception hydrodynamique</li>
	<li>Disponible en plusieurs tailles</li></ul>'
);

INSERT INTO product_detail VALUES(
	4,
	'EN',
	'<ul class="checkmark"><li>Uses composite plastic polymer materials</li>
	<li>Lightweight, making it great for travel</li>
	<li>Efficient propulsion with reduced fatigue</li>
	<li>Increased thrust with reduced drag</li>
	<li>Comfortable open heel foot pocket</li></ul>',
	'<p class="text-justify">Split fins Pro have become the most popular style fin in diving today. Just look around when you are out beach diving or on the charter boat and you will soon discover that more divers are making the switch to this style fin. Why are they so popular? They are popular because they work, and you, work less! A split fin performs more like the combination of a whale''s tail and a propeller. When you kick the two separate blades twist and create more of a propeller surface which will increase your propulsion and lift. You feel as if the fin is not strong enough to keep you moving as fast as you are accustomed with your full bladed fin, yet you cover the same distance in the same time.</p>
	<p class="text-justify">Less drag, more thrust and most important less strength is used. The split fin design is not only unique; it uses the latest technology in composite plastic polymer materials to give a light fin (great travel fin) and one that increases thrust and reduces fatigue. Fin is equipped with EZ-LOK squeeze style quick-release buckles which snap on and off with ease yet will not disengage accidentally. Extensive R&D and testing yielded the perfect formula of flexibility and rigidity for efficient propulsion. Atomic multi-composite plastics result in a powerful kick that requires less effort, stress and strain meaning less air consumption. The power rails are highly resilient and perform as the backbone of the split fin, storing and releasing energy with every kick. The semi-ridged flex battens set in the soft elastomeric blade, control the precise wing shape to optimize thrust and reduce drag. The large surface area blade improves pivoting, turning and alternate kick styles.</p>
	<p class="text-justify">Thin yet strong and highly flexible hinge points between the semi-ridged battens cause the blade to react quick and efficiently to the slightest kick. The anatomically contoured foot pocket designed to fit your foot without stress points, with semi-open toe for added comfort. The internal sole plate creates ridged platform beneath the foot for greater power transfer to the blade yet provides a soft, comfortable open heel foot pocket. Fins are available in multiple sizes and colors. So, make the switch and use less effort which equates to less air usage and longer more comfortable dives.</p>',
	'<ul class="indent-disc"><li>Less Drag, More Thrust, Less Strength is Used</li>
	<li>Latest Technology in Composite Plastic Polymer Materials</li>
	<li>Light Fin (Great Travel Fin)</li>
	<li>Increases Thrust and Reduces Fatigue</li>
	<li>EZ-LOK Squeeze-Style Quick-Release Buckles</li>
	<li>Buckles Snap-On-and-Off with Ease, Will Not Disengage Accidentally</li>
	<li>Rubber Straps with Large Pull Tab for Easy Donning and Doffing</li>
	<li>Flexibility and Rigidity for Efficient Propulsion</li>
	<li>Less Air Consumption</li>
	<li>Power Rails: Backbone of Split Fin, Highly-Resilient, Storing & Releasing Energy w/Every Kick</li>
	<li>Semi-Ridged Flex Battens: Control Precise Wing Shape to Optimize Thrust & Reduce Drag</li>
	<li>Large Surface Area Blade Improves Pivoting, Turning & Alternate Kick Styles</li>
	<li>Thin Yet Strong & Highly Flexible Hinge Points Cause Blade to React Quick-&-Efficiently</li>
	<li>Anatomically Contoured Foot Pocket Designed to Fit Foot w/o Stress Points</li>
	<li>Semi-Open Toe for Added Comfort</li>
	<li>Internal Sole Plate, Ridged Platform Beneath-the-Foot, Greater Power Transfer to Blade</li>
	<li>Soft, Comfortable Open Heel Foot Pocket</li>
	<li>Available in Multiple Sizes and Colors</li></ul>'
);

INSERT INTO product_detail VALUES(
	4,
	'FR',
	'<ul class="checkmark"><li>Utilise des matériaux polymères plastiques composites</li>
	<li>Léger, idéal pour les voyages</li>
	<li>Une propulsion efficace avec une fatigue réduite</li>
	<li>Augmentation de la poussée avec une traînée réduite</li>
	<li>Poche pied confortable à talon ouvert</li></ul>',
	'<p class="text-justify">Les nageoires divisées Pro sont devenues la nageoire de style la plus populaire en plongée aujourd''hui. Il suffit de regarder autour de vous lorsque vous faites de la plongée sur la plage ou sur un bateau affrété et vous découvrirez bientôt que de plus en plus de plongeurs passent à cette nageoire de style. Pourquoi sont-ils si populaires? Ils sont populaires parce qu''ils travaillent, et vous, travaillez moins! Une nageoire fendue se comporte plus comme la combinaison de la queue d''une baleine et d''une hélice. Lorsque vous frappez les deux lames séparées, tournez et créez davantage une surface d''hélice qui augmentera votre propulsion et votre portance. Vous avez l''impression que l''aileron n''est pas assez fort pour vous permettre de bouger aussi vite que vous êtes habitué avec votre aileron à lame pleine, mais vous couvrez la même distance en même temps.</p>
	<p class="text-justify">Moins de traînée, plus de poussée et le plus important moins de force est utilisé. La conception de la dérive est non seulement unique; Il utilise les dernières technologies en matière plastique composite polymère pour donner une ailette légère (grande ailette de voyage) qui augmente la poussée et réduit la fatigue. Fin est équipé de boucles à dégagement rapide de type EZ-LOK Squeeze qui s''enclenchent et se détachent facilement, sans se dégager accidentellement. La recherche et le développement approfondis et les tests ont abouti à la formule parfaite de flexibilité et de rigidité pour une propulsion efficace. Les plastiques multi-composites atomiques produisent un coup de pied puissant qui nécessite moins d''effort, de stress et de tension, ce qui signifie moins de consommation d''air. Les rails d''alimentation sont très résistants et constituent l''épine dorsale de l''aileron divisé, stockant et libérant de l''énergie à chaque coup. Les lattes flexibles semi-striées placées dans la lame en élastomère souple contrôlent la forme précise de l''aile pour optimiser la poussée et réduire la traînée. La lame de grande surface améliore le pivotement, le tournage et les styles de coup de pied alternés.</p>
	<p class="text-justify">Des charnières minces mais solides et très flexibles entre les lattes semi-striées font que la lame réagit rapidement et efficacement au moindre coup de pied. La poche plantaire à la forme anatomique conçue pour s''adapter à votre pied sans points de contrainte, avec bout semi-ouvert pour plus de confort. La semelle interne crée une plate-forme striée sous le pied pour un meilleur transfert de puissance à la lame, tout en offrant une poche de pied de talon ouverte douce et confortable. Les palmes sont disponibles en plusieurs tailles et couleurs. Alors, faites le changement et utilisez moins d''effort, ce qui équivaut à une consommation d''air moindre et à des plongées plus confortables.</p>',
	'<ul class="indent-disc"><li>Moins de glissement, plus de poussée, moins de force est utilisée</li>
	<li>La technologie la plus récente en matière de matériaux composites à base de polymères plastiques</li>
	<li>Aileron léger (Great Travel Fin)</li>
	<li>Augmente la poussée et réduit la fatigue</li>
	<li>Boucles à serrage rapide à serrage rapide EZ-LOK</li>
	<li>Boucle le snap-on-and-off avec facilité, ne se désengage pas accidentellement</li>
	<li>Courroies en caoutchouc avec grande languette de tirage pour une connexion et un retrait faciles</li>
	<li>Flexibilité et rigidité pour une propulsion efficace</li>
	<li>Moins de consommation d’air</li>
	<li>Power Rails: épine dorsale de l''aileron divisé, hautement résilient, stockant et libérant de l''énergie avec chaque coup de pied</li>
	<li>Battens flex à demi-galbées: contrôlez la forme précise des ailes pour optimiser la poussée et réduire la traînée</li>
	<li>La lame à grande surface améliore les styles de pivotement, de rotation et d’autres types de coup de pied</li>
	<li>Les points de charnière à la fois fins et résistants et hautement flexibles provoquent une réaction rapide et efficace de la lame</li>
	<li>Poche anatomiquement adaptée au pied conçue pour s''adapter aux pieds sans stress</li>
	<li>Bouts semi-ouverts pour plus de confort</li>
	<li>Plaque de semelle interne, plate-forme striée sous le pied, transfert de puissance accru vers la lame</li>
	<li>Poche de pied à talon ouvert souple et confortable</li>
	<li>Disponible en plusieurs tailles et couleurs</li></ul>'
);

INSERT INTO product_detail VALUES(
	5,
	'EN',
	'<ul class="checkmark"><li>Multi-flex blade system</li>
	<li>Split blade and hybrid rib design</li>
	<li>Two winged shaped surfaces for life</li>
	<li>27 degree angle blade for optimum efficiency</li>
	<li>10% longer blade length than SF-8</li></ul>',
	'<p class="text-justify">Over 5 years of research and development brought the highly regarded and best-selling SF-8 X-Pert Zoom to market in 2003. TUSA redefines the fin market again with the introduction of the SF-15 X-Pert Zoom Z3. The X-Pert 3Z further improves upon the performance, features and design of the SF-8 with the incorporation of 3 materials, 10% longer blade length, enhanced propeller-fin technology, reinforced blade rails and optimized blade scoops. These new features along with TUSA''s patented 27° angled blade design and EZ strap buckle system make the X-Pert Zoom Z3 The Fin for Divers.</p>
	<p class="text-justify">When using the standard traditional blade fin, with the leg completely extended, there remains an angle of 27° between the heel and the foot and the calf of the leg, causing a 10% loss of propulsion. Because the fin is angled below the body, during the kick phase, the body is pushed forward and down, instead of straight ahead. With the X-Pert Z3 Fin, that 27° angle has been designed into the fin. This means that 100% of the energy expended during the kick phase is directed toward the propulsion of the diver. To achieve maximum performance from this fin, use a small bent knee kick with a light rhythm. This creates less strain on the leg muscles compared with traditional fins, reducing the diver''s fatigue and subsequent air consumption.</p>
	<p class="text-justify">TUSA''s advanced split fins employ propeller fin technology, which delivers ultra-high performance with a low amplitude rapid flutter kick. As the fin moves through the water its two wing-shaped surfaces create lift and forward propulsion like a propeller. Any water traveling over the top of the blade is funneled into and out of the split between the blades. Efficiency is increased while drag and effort is reduced. Fins are equipped with TUSA''s high quality stainless-steel spring straps with TUSA''s EZ buckle system. The spring straps do not need to be adjusted for size and easily slip over the heel securely when donning and doffing the fins. The EZ buckle system has squeeze-style" side-release buckles allowing quick and easy adjustments with minimal effort. Adjustment can be made while the fins are worn, allowing for a precise fit and ease of removal when necessary. Spring straps are also depth compensating and automatically adjust for wet suit boot compression at depth. Straps are equipped with a comfortable rubber heel grip with a large finger loop for an easy fit. The TUSA X-Pert Zoom Z3 Fins are available in multiple sizes and colors. Fin measure 22.8" to 25.7" (57.8 cm to 65.3 cm) depending on size.</p>
	<p class="text-justify">The TUSA X-Pert Zoom Z3 is commonly used for Recreation, SCUBA, Snorkeling, Travel and more. The TUSA X-Pert Zoom Z3 Open Heel Split Fins is most used by customers who consider themselves to be a Advanced, Beginner, Casual/ Recreational among others. The TUSA X-Pert Zoom Z3 is popular because customers like the following qualities of the TUSA X-Pert Zoom Z3: Accommodates Boots, Comfortable, Efficient, Lightweight.</p>',
	'<ul class="indent-disc"><li>Combines: Propeller-Fin Technology</li>
	<li>TUSA''s Multi-Flex Blade System and Patented Angled Blade Design</li>
	<li>X-Pert Fin Provides Speed & Power w/Less Effort & Fatigue</li>
	<li>Generates Maximum Performance</li>
	<li>Comfort w/Minimum Strain on Leg Muscles</li>
	<li>Allows Small Bent-Knee Kick w/Light Rhythm</li>
	<li>Innovative Hydrofoil (Split Blade) & Hybrid Rib Design</li>
	<li>Produce Greater Forward Motion (lift) Both-On-the-Surface & Underwater</li>
	<li>Two Wing-Shaped Surfaces Create Lift & Forward Propulsion Like Propeller</li>
	<li>Water Traveling Over Top of Blade Funneled Into-&-Out of Split Blades
	<li>Efficiency Increased while Drag & Effort is Reduced</li>
	<li>Up-Stroke Provides Maximum Power and Propulsion</li>
	<li>TUSA''s 27° Angled Blade Design Ensures Maximum Efficiency Thru-Out Kicking Cycle</li>
	<li>Multi-Compound Foot Pocket Increases Power Transfer to Blade</li>
	<li>Reinforced Blade Rails & Optimized Blade Scoops</li>
	<li>10% Longer Blade Length than SF-8 for Enhanced Propeller Effect</li>
	<li>3 Material Design for Increased Performance</li>
	<li>TUSA Patented EZ Strap & Buckle System</li>
	<li>Squeeze-Style" Side-Release Buckles for Quick-&-Easy Adjustments</li>
	<li>High Quality Stainless-Steel Strap</li>
	<li>Durable Stainless-Steel Coil Spring Won''t Rust or Break</li>
	<li>Automatically Adjusts to Changing Conditions</li>
	<li>Rubber Heel Grip with Finger Loop for Easy Fit</li>
	<li>Fin Length: 22.8" to 25.7" (57.8 cm to 65.3 cm)</li>
	<li>Available in Multiple Sizes and Colors</li></ul>'
);

INSERT INTO product_detail VALUES(
	5,
	'FR',
	'<ul class="checkmark"><li>Système de lames multi-flex</li>
	<li>Conception de la lame fendue et des côtes hybrides</li>
	<li>Deux surfaces ailées pour la vie</li>
	<li>Lame à angle est de 27 degrés pour une efficacité optimale</li>
	<li>10% de longueur de lame plus longue que SF-8</li></ul>',
	'<p class="text-justify">En 2003, plus de 5 années de recherche et de développement ont permis de commercialiser le zoom SF-8 X-Pert hautement réputé et le plus vendu. TUSA redéfinit le marché des palmes avec le lancement du zoom Z-X X-Pert SF-15. Le X-Pert 3Z améliore encore les performances, les caractéristiques et la conception du SF-8 en incorporant 3 matériaux, une longueur de lame supérieure de 10%, une technologie améliorée des ailettes, des rails de lame renforcés et des pelles optimisées. Ces nouvelles caractéristiques, associées à la conception de lame coudée à 27 ° brevetée par TUSA et au système de boucle à courroie EZ, font du X-Pert Zoom Z3 The Fin pour les plongeurs.</p>
	<p class="text-justify">Lors de l''utilisation de l''aileron de lame traditionnel standard, avec la jambe complètement déployée, il reste un angle de 27 ° entre le talon et le pied et le mollet de la jambe, entraînant une perte de propulsion de 10%. Parce que la nageoire est inclinée sous le corps, pendant la phase de coup de pied, le corps est poussé vers l''avant et vers le bas, au lieu d''être tout droit. Avec le X-Pert Z3 Fin, cet angle de 27 ° a été conçu dans l''aileron. Cela signifie que 100% de l''énergie dépensée pendant la phase de coup de pied est dirigée vers la propulsion du plongeur. Pour obtenir une performance maximale de cette nageoire, utilisez un petit coup de genou plié avec un rythme léger. Cela crée moins de pression sur les muscles des jambes par rapport aux nageoires traditionnelles, ce qui réduit la fatigue du plongeur et la consommation d''air subséquente.</p>
	<p class="text-justify">Les ailerons séparés avancés de TUSA utilisent la technologie des ailettes à hélice, qui offre des performances ultra-élevées avec un battement rapide rapide de faible amplitude. Lorsque l''aileron se déplace dans l''eau, ses deux surfaces en forme d''ailes créent une propulsion ascendante et avant comme une hélice. Toute eau circulant sur le dessus de la lame est canalisée vers et hors de la séparation entre les lames. L''efficacité est accrue lorsque la traînée et l''effort sont réduits. Les palmes sont équipées de sangles à ressort en acier inoxydable de haute qualité avec le système de boucle EZ de TUSA. Les bretelles ne doivent pas être ajustées à la taille et glissent facilement sur le talon pour enfiler et retirer les palmes. Le système de boucle EZ est doté de "boucles latérales permettant un ajustement rapide et facile avec un minimum d''effort. Le réglage peut être effectué lorsque les ailettes sont usées, ce qui permet un ajustement précis et une facilité de retrait si nécessaire. ajustement automatique pour la compression de la botte de combinaison humide en profondeur.Les bretelles sont équipées d''une prise de talon en caoutchouc confortable avec une grande boucle pour un ajustement facile.Les palmes TUSA X-Pert Zoom Z3 sont disponibles en plusieurs tailles et couleurs. à 25,7 "(57,8 cm à 65,3 cm) selon la taille.</p>
	<p class="text-justify">Le TUSA X-Pert Zoom Z3 est couramment utilisé pour les loisirs, la plongée, la plongée en apnée, les voyages, etc. Les ailerons fendus à talon ouvert X-Pert Zoom Z3 de TUSA sont les plus utilisés par les clients qui se considèrent, entre autres, comme étant avancés, débutants, occasionnels / récréatifs. Le TUSA X-Pert Zoom Z3 est populaire parce que les clients apprécient les qualités suivantes du zoom X-Pert Zoom Z3 de TUSA: convient aux bottes, confortable, efficace et léger.</p>',
	'<ul class="indent-disc"><li>Combine: Technologie Propeller-Fin</li>
	<li>Système de lame Multi-Flex de TUSA et conception de lame angulaire brevetée</li>
	<li>L''aileron X-Pert fournit vitesse et puissance avec moins d''effort et de fatigue</li>
	<li>Génère des performances maximales</li>
	<li>Confort avec contrainte minimale sur les muscles de la jambe</li>
	<li>Permet un petit coup de pied au genou avec un rythme léger</li>
	<li>Conception innovante de Hydrofoil (Split Blade) et Hybrid Rib</li>
	<li>Produire un mouvement vers l''avant (ascenseur) plus large que sur la surface et sous l''eau</li>
	<li>Deux surfaces en forme d’ailes créent une propulsion ascendante et avancée comme une hélice</li>
	<li>L''eau se déplaçant au-dessus de la lame entonnée dans et hors des lames fendues
	<li>Efficacité accrue pendant que le glisser-déposer est réduit</li>
	<li>Up-Stroke fournit une puissance et une propulsion maximales</li>
	<li>La conception de lame à angle de 27 ° de TUSA garantit un cycle de déviation maximale grâce à une efficacité maximale</li>
	<li>La poche de pied à plusieurs composants augmente le transfert de puissance vers la lame</li>
	<li>Rails de lame renforcés et pelles à lame optimisées</li>
	<li>10% de longueur de lame supérieure à celle du SF-8 pour un effet d''hélice amélioré</li>
	<li>3 Conception matérielle pour une performance accrue</li>
	<li>Système breveté EZ Strap & Buckle de TUSA</li>
	<li>Squeeze-Style "Boucles à déclenchement latéral pour des ajustements rapides et faciles</li>
	<li>Bracelet en acier inoxydable de haute qualité</li>
	<li>Un ressort en acier inoxydable durable ne rouille pas et ne casse pas</li>
	<li>Ajuste automatiquement à la modification des conditions</li>
	<li>Poignée à talon en caoutchouc avec boucle de doigt pour un ajustement facile</li>
	<li>Longueur des ailerons: 22,8 "à 25,7" (57,8 cm à 65,3 cm)</li>
	<li>Disponible en plusieurs tailles et couleurs</li></ul>'
);

INSERT INTO product_detail VALUES(
	6,
	'EN',
	'<ul class="checkmark"><li>Designed to simulate shape of marine animals</li>
	<li>Soft pad heel strap with finger loop</li>
	<li>Winglets along length of blade for efficiency</li></ul>',
	'<p class="text-justify">The Oceanic Manta Ray Open Heel Fins, inspired by nature, three advanced materials simulate the shape & mechanics of marine animals. Fin blades are made from techno-polymer advanced material that provides the strength of bone to maximize power, speed & efficiency, while being extremely lightweight & durable. Oceanic''s Power-X System is a revolutionary material that acts as tendon & joint, optimizing propulsion by flexing during the down-stroke and releasing stored energy prior to the upstroke. Unique positioning allows the Power-X System to deliver maximum power to the blade while evenly distributing pressure over the foot to minimize fatigue. Blades have power channels that are flexible material simulates the elasticity of skin by directing water flow off the back of the blade for increased thrust. Inspired by aircraft technology, winglets along the length of the blade increase efficiency and improve maneuverability.</p>
	<p class="text-justify">Fins come equipped with soft-pad heel spring straps that have an ergonomic finger-loop which allows the fin to be easily removed & replaced, even with thick neoprene gloves. Easy buckle adjustment (EBA) allows for more than 2" (5 cm) of precise adjustments for a custom fit without tools. Easy to use spring straps automatically compensates for different size feet and boots. Spring fin straps are depth compensating because they will compress to changes in the thickness of your boots. The Oceanic Manta Ray Fins have a non-vented blade design and are available in multiple colors and sizes.</p>',
	'<ul class="indent-disc"><li>Inspired by Nature, 3-Advanced Materials Simulate Shape & Mechanics of Marine Animals</li>
	<li><b>Blades Made from Techno-Polymer:</b><ul class="indent-none">
	<li>Advanced Material Provides Strength of Bone</li>
	<li>Maximized Power</li>
	<li>Speed & Efficiency</li>
	<li>Extremely Lightweight & Durable</li></ul></li>
	<li><b>Power-X System:</b><ul class="indent-none">
	<li>Revolutionary Material, Acts as Tendon & Joint</li>
	<li>Optimizing Propulsion by Flexing on Down-Stroke</li>
	<li>Releasing Stored Energy Prior to Upstroke</li>
	<li>Delivers Maximum Power to Blade</li>
	<li>Evenly Distributing Pressure Over Foot to Minimize Fatigue</li></ul></li>
	<li><b>Power Channels:</b><ul class="indent-none">
	<li>Flexible Material Simulates Elasticity of Skin</li>
	<li>Directs Water Flow Off-Back of Blade for Increased Thrust</li></ul></li>
	<li><b>Inspired by Aircraft Technology:</b><ul class="indent-none">
	<li>Winglets On Length of Blade</li>
	<li>Increase Efficiency, Improves Maneuverability</li></ul></li>
	<li><b>Soft-Pad Heel Spring Straps:</b><ul class="indent-none">
	<li>Ergonomic Finger-Loop</li>
	<li>Allows Fin-to-Be Easily Removed & Replaced</li>
	<li>Even w/Thick Neoprene Gloves</li></ul></li>
	<li>Easy Buckle Adjustment (EBA)</li>
	<li>EBA: Allows More than 2" (5 cm) of Precise Adjustments, Custom Fit w/o Tools</li>
	<li>Strap Springs Automatically Compensates for Different Size-Feet and Boots</li>
	<li>Depth Compensating: Compress-to-Changes in Thickness of Boots</li>
	<li>Non-Vented Blade Design</li>
	<li>Available in Multiple Colors and Sizes</li></ul>'
);

INSERT INTO product_detail VALUES(
	6,
	'FR',
	'<ul class="checkmark"><li>Conçu pour simuler la forme des animaux marins</li>
	<li>Sangle de talon à coussinet souple avec boucle pour les doigts</li>
	<li>Winglets le long de la lame pour plus d''efficacité</li></ul>',
	'<p class="text-justify">Les ailerons à talon ouvert Oceanic Manta Ray, inspirés par la nature, trois matériaux avancés simulent la forme et la mécanique des animaux marins. Les lames d''aileron sont fabriquées à partir d''un matériau techno-polymère avancé qui offre la solidité de l''os pour maximiser la puissance, la vitesse et l''efficacité, tout en étant extrêmement léger et durable. Le système Power-X d''Oceanic est un matériau révolutionnaire qui agit en tant que tendon et articulation, optimisant la propulsion en fléchissant pendant le mouvement descendant et en libérant l''énergie stockée avant la course ascendante. Le positionnement unique permet au système Power-X de fournir une puissance maximale à la lame tout en répartissant uniformément la pression sur le pied pour minimiser la fatigue. Les lames ont des canaux de puissance qui sont des matériaux flexibles qui simulent l’élasticité de la peau en dirigeant le flux d’eau à l’arrière de la lame pour augmenter la poussée. Inspirés par la technologie des aéronefs, les winglets sur toute la longueur de la lame augmentent l’efficacité et améliorent la maniabilité.</P>
	<p class="text-justify">Les palmes sont équipées de sangles à ressorts à talon souple avec une boucle ergonomique qui permet de retirer et de remplacer facilement l’aileron, même avec des gants épais en néoprène. Le réglage facile de la boucle (EBA) permet des ajustements précis de plus de 2 "(5 cm) pour un ajustement personnalisé sans outils. Des courroies à ressort faciles à utiliser compensent automatiquement les différentes tailles de pieds et de bottes. aux changements d''épaisseur de vos bottes Les palmes Oceanic Manta Ray ont un design de lame non ventilé et sont disponibles en plusieurs couleurs et tailles.</p>',
	'<ul class="indent-disc"><li>Inspiré par la nature, 3-matériaux avancés Simuler la forme et la mécanique des animaux marins</li>
	<li><b>Lames en techno-polymère:</b><ul class="indent-none">
	<li>Le matériau avancé offre une solidité osseuse</li>
	<li>Puissance maximisée</li>
	<li>Rapidité et efficacité</li>
	<li>Extrêmement léger et durable</li></ul></li>
	<li><b>Système Power-X: </b> <ul class="indent-none">
	<li>Matériel révolutionnaire, agissant comme un tendon et un joint</li>
	<li>Optimisation de la propulsion en fléchissant sur le ralentissement</li>
	<li>Libérer de l’énergie stockée avant le lancement</li>
	<li>Fournit une puissance maximale à la lame</li>
	<li>Distribution uniforme de la pression sur le pied pour minimiser la fatigue</li></ul></li>
	<li><b>Canaux d''alimentation:</b><ul class="indent-none">
	<li>Le matériau flexible simule l’élasticité de la peau</li>
	<li>Dirige le débit d’eau hors de la lame pour augmenter la poussée</li></ul></li>
	<li><b>Inspiré par la technologie aéronautique:</b><ul class="indent-none">
	<li>Winglets sur la longueur de la lame</li>
	<li>Augmenter l''efficacité, améliorer la maniabilité</li></ul></li>
	<li><b>Sangles de ressort à talon souple:</b><ul class="indent-none">
	<li>Boucle ergonomique</li>
	<li>Permet de supprimer et de remplacer facilement Fin-to-Be</li>
	<li>Même avec des gants épais en néoprène</li></ul></li>
	<li>Réglage facile de la boucle (EBA)</li>
	<li>EBA: permet des ajustements précis de plus de 2 "(5 cm), ajustement personnalisé sans outils</li>
	<li>Strap Springs compense automatiquement la taille des pieds et des bottes</li>
	<li>Compensation de la profondeur: Compression par rapport à l’épaisseur des bottes</li>
	<li>Conception de lame non ventilée</li>
	<li>Disponible en plusieurs couleurs et tailles</li></ul>'
);

--###################################################################################

INSERT INTO product_detail VALUES(
	7,
	'EN',
	'<ul class="checkmark"><li>Designed for women and those with small faces</li>
	<li>Inverted tear drop shaped lenses</li>
	<li>Lens are raked inward to sit closer to eyes</li>
	<li>Downward Visibility Increased by 25%</li>
	<li>Crystal clear silicone skirt</li></ul>',
	'<p class="text-justify">The Cressi Eyes Evolution Mask comes with all the great features of the Big Eyes Evolution Mask, but in a smaller size that''s perfect for women and smaller faces. This revolutionary mask is made from black hypoallergenic high seal soft silicone rubber, a new material that offers extraordinary and unprecedented comfort and fit. The mask rests on the face with this unprecedented silicone rubber and does not leave any marks on the skin, even after extended use. So, if you''re tired of your mask gives you ring-around the eyeballs, this mask is for you. Naturally, to obtain such a result the entire structure of the skirt is differentiated, with internal ribs that stiffen the parts of the mask that are most stressed.</p>
	<p class="text-justify">Mask gives an exceptionally wide field of view. The raked dual tempered glass lenses, with their inverted teardrop shape (Cressi Patent) rest as close to the eyes as possible, so that the already extraordinary field of view is increased by 25% over the Cressi Matrix Mask. The mask strap uses the exclusive patented Cressi system of double injecting of a flexible elastomer on a rigid element which allows the buckles of the strap to mounted not on the skirt structure as done with other masks, but on the indestructible elastic element that tilt on a vertical plane and can be completely bent sideways up to 180° curve. The silicone mask strap is a wide split strap for even dispersion for increased fit and comfort.</p>
	<p class="text-justify">The thickness of the mask frame has been reduced to such an extent that it is practically invisible when the mask is being worn. The mask skirt is a double feathered edge design and has an easy-to-reach one-hand nose pocket for ear equalization which can be utilized even when wearing thick gloves. To protect your mask when not in use the Eye comes with a hard-plastic protective mask box. Mask is available in multiple color choices.</p>',
	'<ul class="indent-disc"><li>Specifically Designed for Women and Divers with Smaller Faces</li>
	<li>100% Hypoallergenic Crystal Clear High Seal Silicone Skirt</li>
	<li>Double Feathered Edged Skirt for a Great Seal and Comfort</li>
	<li>Won''t give "Ring-Around-the-Eyeballs"</li>
	<li>Differentiated, Internal Rib Stiffeners Relieve Stressed Areas</li>
	<li>Instantly Adjustable Swivel Buckles are Joined-to-Frame by Indestructible Elastic Material</li>
	<li>Buckles Fold Sideways up to 180° Degree</li>
	<li>Wide Split Silicone Mask Strap for Comfort & Fit</li>
	<li>Downward Visibility Increased by 25% Compared to Cressi Matrix Mask</li>
	<li>Low Internal Volume Design</li>
	<li>Unprecedented Comfort and Fit</li>
	<li>Exceptionally Wide Field of View</li>
	<li>Raked Dual Tempered Glass Lenses with Inverted Teardrop Shape</li>
	<li>Easy-to-Reach One-Hand Nose Pocket for Ear Equalization</li>
	<li>Available in Multiple Color Choices</li>
	<li>Protective Hard Mask Box for Storage</li></ul>'
);

INSERT INTO product_detail VALUES(
	7,
	'FR',
	'<ul class="checkmark"><li>Conçu pour les femmes et les petits visages</li>
	<li>Lentilles en forme de gouttes inversées</li>
	<li>La lentille est inclinée vers l’intérieur pour s’asseoir plus près des yeux</li>
	<li>Augmentation de la visibilité vers le bas de 25%</li>
	<li>Jupe en silicone transparente</li></ul>',
	'<p class="text-justify">Le masque Cressi Eyes Evolution est doté de toutes les fonctionnalités du masque Big Eyes Evolution, mais dans un format plus petit, idéal pour les femmes et les petits visages. Ce masque révolutionnaire est fabriqué à partir de caoutchouc de silicone souple hypoallergénique noir à haut joint, un nouveau matériau qui offre un confort et un ajustement extraordinaires et sans précédent. Ce masque en silicone sans précédent repose sur le visage et ne laisse aucune trace sur la peau, même après une utilisation prolongée. Donc, si vous êtes fatigué de ce que votre masque vous donne les yeux ronds, ce masque est pour vous. Naturellement, pour obtenir un tel résultat, toute la structure de la jupe est différenciée, avec des nervures internes qui raidissent les parties du masque les plus sollicitées.</P>
	<p class="text-justify">Le masque donne un champ de vision exceptionnellement large. Les lentilles doubles en verre trempé, en forme de goutte inversée (Cressi Patent), sont placées aussi près que possible des yeux, ce qui permet d’augmenter le champ de vision de 25% par rapport au masque Cressi Matrix. La sangle du masque utilise le système exclusif breveté Cressi de double injection d''un élastomère flexible sur un élément rigide qui permet aux boucles de la sangle de se monter non pas sur la structure de la jupe comme avec d''autres masques, mais sur l''élément élastique indestructible plan vertical et peut être complètement plié latéralement jusqu''à 180 ° courbe. La sangle du masque en silicone est une large sangle fendue pour une dispersion uniforme pour un ajustement et un confort accrus.</P>
	<p class="text-justify">L''épaisseur du cadre du masque a été réduite à un point tel qu''il est pratiquement invisible lorsque le masque est porté. La jupe du masque est à double bord et comporte une poche nasale d''une main facile à atteindre pour une égalisation de l''oreille qui peut être utilisée même avec des gants épais. Pour protéger votre masque lorsque vous ne l''utilisez pas, Eye est livré avec un masque de protection en plastique dur. Le masque est disponible en plusieurs couleurs.</P>',
	'<ul class="indent-disc"><li>Conçu spécialement pour les femmes et les plongeurs ayant des visages plus petits</li>
	<li>Jupe en silicone 100% hypoallergénique, transparente et à joint élevé</li>
	<li>Jupe à double bordures à plumes pour un meilleur sceau et confort</li>
	<li>Ne donnera pas "Ring-Around-the-Eye-Balls"</li>
	<li>Les raidisseurs de côtes internes différenciés soulagent les zones stressées</li>
	<li>Les boucles pivotantes à réglage instantané sont jointes à la monture par un matériau élastique indestructible</li>
	<li>Boucles à replier latéralement jusqu''à 180 °</li>
	<li>Sangle large en silicone pour plus de confort et d''MTajustement</li>
	<li>La visibilité à la baisse a augmenté de 25% par rapport au masque matriciel Cressi</li>
	<li>Conception de volume interne faible</li>
	<li>Confort et ajustement sans précédent</li>
	<li>Champ de vision exceptionnellement large</li>
	<li>Lentilles en verre trempé double rugueuses avec forme de larme inversée</li>
	<li>Poche de nez à une main, facile à atteindre, pour l''égalisation des oreilles</li>	
	<li>Disponible dans plusieurs choix de couleurs</li>
	<li>Boîte de protection dure pour le stockage</li></ul>'
);

INSERT INTO product_detail VALUES(
	8,
	'EN',
	'<ul class="checkmark"><li>Low volume mask construction</li>
	<li>Single lens mask for a wide field of vision</li>
	<li>Low profile hydrodynamic design</li>
	<li>Tempered glass lens has exceptional clarity</li>
	<li>One handed nose well for easy equalization</li></ul>',
	'<p class="text-justify">When you learned how to dive your instructor told you the most important part of choosing equipment was comfort and fit. When looking for a mask you also need a great field of vision well this mask was designed to meet those and more desirable qualities. The Atomic Aquatics Frameless 2 Masks give the diver the widest field of view in a single lens mask design. The mask skirt is made from high quality silicone rubber and has a low volume profile to add to the increased field of vision. Low volume also makes mask clearing easier due to less water needing to be displaced. Mask is equipped with easy squeeze-to-adjust buckles that are mounted behind the lens for a more hydrodynamic design.</p> 
	<p class="text-justify">The Atomic Aquatics Frameless 2 Mask is focused on fit, comfort and a wide field of vision. The Atomic Aquatics Aquatics Frameless 2 Mask with its large tempered glass lens and close-fitting skirt work in harmony to create perhaps the widest viewing angle of any frameless mask design. The lens shape was computer designed to maximize upward, downward and side-to-side vision. Because an external frame is not needed, the viewable area of the lens is optimized.</p>
	<p class="text-justify">The Atomic Aquatics Frameless 2 Mask offers a new standard feature never seen or seen through before in a diving mask. Atomic Aquatics calls them ultra-clear lenses. What makes ultra-clear special? Did you ever notice that normal dive mask lenses have a green tint to the glass? To see this tint, put your existing mask up to a piece of white paper and see for yourself. The green tint you see is the result of iron impurities left over in lower quality float or window type glass. That green tint distorts true colors and blocks-out some of the light that reaches the eye.</p>
	<p class="text-justify">Ultra-Clear is a new and exciting optical quality tempered glass with exceptional clarity and high light transmission, with no color distortion. The exceptionally high light transmittance and lack of distortion in the ultra-clear lens maximizes the light available for improved visual acuity, especially underwater in low light conditions, better vision, truer colors are what you get with Atomic Aquatics Ultra-Clear Lens. The Atomic Aquatics Frameless 2 Mask has a double feathered edge skirt that provides an excellent seal on the diver''s face with an easy-to-reach one-handed nose well for ear equalization. The wide split style mask strap increases the masks ability to conform to your face adding to its great sealing ability. The mask is available in 2 sizes of regular and medium to fit most divers faces. The Atomic Aquatics Frameless 2 Mask comes in multiple color choices. Both sizes come with a black silicone rubber mask skirt and strap. Mask also comes with a mask box for transport and storage.</p>',
	'<ul class="indent-disc"><li>Atomic Frameless Mask:</li>
	<li>Low Volume Mask:</li>
	<li>Widest Field of Vision in a Single Lens Mask</li>
	<li>Low-Profile Hydrodynamic Design</li>
	<li>Easy Adjust "Squeeze-to-Adjust" Style Strap Buckles</li>
	<li>Durable Black Silicone Rubber Skirt</li>
	<li>Optical Quality Tempered Glass Lenses</li>
	<li>Ultra-Clear Lens: Standard Feature Never Seen or Seen Thru Before</li>
	<li>Lens: Exceptional Clarity and High Light Transmission</li>
	<li>Lens: No Color Distortion</li>
	<li>Double Feathered Edge Skirt</li>
	<li>Wide Split Style Mask Strap</li>
	<li>Easy-to-Reach One-Handed Nose Well for Ear Equalization</li>
	<li>2 Sizes: Regular and Medium to Fit Most Divers Faces</li>
	<li>Available in Multiple Colors</li>
	<li>Mask Box for Transport and Storage</li></ul>'
);

INSERT INTO product_detail VALUES(
	8,
	'FR',
	'<ul class="checkmark"><li>Construction de masque à faible volume</li>
	<li>Masque à objectif unique pour un large champ de vision</li>
	<li>Conception hydrodynamique à profil bas</li>
	<li>Lentille en verre trempé d''une clarté exceptionnelle</li>
	<li>Un nez bien porté pour une égalisation facile</li></ul>',
	'<p class="text-justify">Lorsque vous avez appris à plonger, votre instructeur vous a dit que le plus important dans le choix de l''équipement était le confort et la forme. Lorsque vous recherchez un masque, vous avez également besoin d''un grand champ de vision et ce masque a été conçu pour répondre à ces qualités et à d''autres plus souhaitables. Les masques Atomic Aquatics Frameless 2 donnent au plongeur le champ de vision le plus large possible dans un seul masque de lentille. La jupe du masque est fabriquée à partir de caoutchouc de silicone de haute qualité et présente un faible volume pour ajouter à son champ de vision accru. Un faible volume facilite également le nettoyage du masque en raison de la réduction de la quantité d''eau à déplacer. Le masque est équipé de boucles faciles à ajuster qui sont montées derrière l''objectif pour un design plus hydrodynamique.</P>
	<p class="text-justify">Le masque sans cadre Atomic Aquatics 2 se concentre sur l''ajustement, le confort et un large champ de vision. Le masque Frameless 2 Aquatics AquaMics d''Atomic, avec sa grande lentille en verre trempé et sa jupe ajustée, fonctionne en harmonie pour créer l''angle de vision le plus large de tous les masques sans cadre. La forme de la lentille était conçue par ordinateur pour optimiser la vision vers le haut, le bas et le côté. Un cadre externe n''étant pas nécessaire, la zone visible de l''objectif est optimisée.</P>
	<p class="text-justify">Le masque Frameless 2 Atomic Aquatics offre une nouvelle fonctionnalité standard jamais vue ni vue auparavant dans un masque de plongée. Atomic Aquatics les appelle des lentilles ultra-claires. Qu''est-ce qui rend l''ultra-clair spécial? Avez-vous déjà remarqué que les lentilles de masque de plongée normales ont une teinte verte sur le verre? Pour voir cette teinte, placez votre masque existant sur un morceau de papier blanc et voyez par vous-même. La teinte verte que vous voyez est le résultat d''impuretés de fer laissées dans un verre de type flottant ou à fenêtre de qualité inférieure. Cette teinte verte fausse les vraies couleurs et bloque une partie de la lumière qui atteint les yeux.</P>
	<p class="text-justify">Ultra-Clear est un nouveau verre excité de qualité optique avec une clarté exceptionnelle et une transmission de lumière élevée, sans distorsion des couleurs. La transmission de lumière exceptionnellement élevée et l''absence de distorsion de la lentille ultra-claire maximisent la lumière disponible pour une meilleure acuité visuelle, particulièrement sous l''eau dans des conditions de faible luminosité, une meilleure vision et des couleurs plus fidèles. Atomic Aquatics Frameless 2 Mask possède une jupe à double bord qui offre une excellente étanchéité sur le visage du plongeur avec un nez facile à atteindre pour égaliser les oreilles. La sangle de masque à fente large augmente la capacité du masque à se conformer à votre visage, ajoutant ainsi à sa grande capacité d''étanchéité. Le masque est disponible en 2 tailles de taille régulière et moyenne pour s''adapter à la plupart des visages de plongeurs. Atomic Aquatics Frameless 2 Mask est disponible en plusieurs couleurs. Les deux tailles sont livrées avec une jupe de masque en caoutchouc silicone noir et une lanière. Le masque est également livré avec un masque pour le transport et le stockage.</P>',
	'<ul class="indent-disc"><li>Masque Atomic Frameless:</li>
	<li>Masque à faible volume:</li>
	<li>Le champ de vision le plus large d’un masque à une seule lentille</li>
	<li>Conception hydrodynamique à profil bas</li>
	<li>Ajustement facile des boucles de type "Squeeze-to-Adjust"</li>
	<li>Jupe en caoutchouc silicone noir durable</li>
	<li>Verres en verre trempé de qualité optique</li>
	<li>Lentille ultra-claire: caractéristique standard jamais vue ou vue</li>
	<li>Objectif: clarté exceptionnelle et transmission de lumière élevée</li>
	<li>Lentille: pas de distorsion de couleur</li>
	<li>Jupe à double bord à plumes</li>
	<li>Courroie de masque large et fendue</li>
	<li>Puits de nez à une main facile à utiliser pour la péréquation des oreilles</li>
	<li>2 tailles: standard et moyen pour s''adapter à la plupart des visages de plongeurs</li>
	<li>Disponible en plusieurs couleurs</li>
	<li>Boîte de masque pour le transport et le stockage</li></ul>'
);

INSERT INTO product_detail VALUES(
	9,
	'EN',
	'<ul class="checkmark"><li>Frameless mask with single lens design</li>
	<li>Tempered glass lens for extra durability</li>
	<li>Ultra clear lens for vivid colors</li>
	<li>Soft and comfortable mask skirt</li>
	<li>Low volume design allows easy purging</li></ul>',
	'<p class="text-justify">A Blue Reef favorite, the Frameless II Mask features a comfortable low profile lightweight frameless mask design. The Frameless II Mask has a 100% silicone rubber double feathered edge skirt and a wide split strap design which combined for a perfect seal on the divers face. The single front tempered CE approved glass lens provides an exceptional field of vision. This low volume mask has an easy to reach one handed nose pocket for ear equalization and the low internal volume makes it easy to clear. The push button buckle assemblies make adjustments and positioning the mask on the face easy.</p>',
	'<ul class="indent-disc"><li>Blue Reef Frameless II Mask</li>
	<li>Single Lens Mask</li>
	<li>Wide Field of Vision</li>
	<li>100% Silicone Double Feathered Edge Skirt</li>
	<li>Wide Split Strap Design</li>
	<li>Skirt & Strap Combine for Excellent Face Seal</li>
	<li>Large Easy-to-Reach Nose Pocket for Ear Equalization</li>
	<li>Tempered CE Approved Glass Lens</li>
	<li>Low Volume Design</li>
	<li>Frameless Design, Easily Fits in BCD Pocket</li>
	<li>Low Profile Lightweight</li>
	<li>Push Button Buckle for Easy Strap Adjustments</li></ul>'
);

INSERT INTO product_detail VALUES(
	9,
	'FR',
	'<ul class="checkmark"><li>Masque sans cadre avec un seul objectif</li>
	<li>Lentille en verre trempé pour une durabilité accrue</li>
	<li>Lentille ultra claire pour des couleurs vives</li>
	<li>Jupe de masque souple et confortable</li>
	<li>La conception à faible volume permet une purge facile</li></ul>',
	'<p class="text-justify">Coup de cœur de Blue Reef, le masque Frameless II est doté d''un masque léger sans encoches léger et confortable. Le masque Frameless II est doté d''une jupe à double bord à plumes en caoutchouc de silicone à 100% et d''une large conception de sangle fendue qui, combinée pour une parfaite étanchéité sur le visage des plongeurs. La lentille en verre trempé CE approuvée à l''avant unique offre un champ de vision exceptionnel. Ce masque à faible volume a une poche nasale facile à atteindre pour l’égalisation de l’oreille et son faible volume interne le rend facile à nettoyer. Les assemblages à boucle à bouton-poussoir permettent de régler et de positionner le masque facilement sur le visage.</P>',
	'<ul class="indent-disc"><li>Masque Frameless II Blue Reef</li>
	<li>Masque à lentille unique</li>
	<li>Champ de vision large</li>
	<li>Jupe à double bord en silicone à 100%</li>
	<li>Conception large de sangle fendue</li>
	<li>Combinaison jupe et sangle pour une excellente étanchéité du visage</li>
	<li>Grande poche à nez facile à atteindre pour l’égalisation des oreilles</li>
	<li>Lentille en verre trempé approuvé CE</li>
	<li>Conception à faible volume</li>
	<li>Conception sans cadre, se glisse facilement dans la poche BCD</li>
	<li>Léger profil bas</li>
	<li>Boucle à bouton-poussoir pour des ajustements faciles de la sangle</li></ul>'
);

INSERT INTO product_detail VALUES(
	10,
	'EN',
	'<ul class="checkmark"><li>Single window design with tempered glass lens</li>
	<li>Low volume and lightweight construction</li>
	<li>Wide field of viewSoft and comfortable silicone skirt</li>
	<li>Neoprene strap prevents hair tangles</li></ul>',
	'<p class="text-justify">It''s a mere Shadow of a Mask; Lightweight and low volume, with a soft, comfortable, hypoallergenic black or clear liquid-silicone skirt. Because there is no frame, the Shadow''s single lens sits close to the face, offering an unusually wide field of view. Also, because there is no frame, the mask folds into a neat package small enough to slip into a BC pocket, making it an easy to carry as a back-up. The black silicone skirt eliminates light coming in from the sides, which means the Shadow is an excellent mask for hunters and photographers who need to see, well, in the shadows. The clear version will satisfy those who prefer the translucent transmission of light into the mask.</p>
	<p class="text-justify">The Shadow mask has buckles that swivel and are easy to adjust, allowing a custom fit. It is available in two sizes suitable for a wide range of faces. The Shadow has a double feathered edge skirt for a great seal and a large easy to reach one-handed nose pocket for ear equalization that works even when wearing heavy neoprene gloves. The single safety tempered glass lens provides a clear view and the Shadow now includes a neoprene comfort strap that won''t get tangled in your hair and the soft neoprene rubber design increases comfort. The Shadow comes with a mask box.</p>',
	'<ul class="indent-disc"><li>Lightweight and Low Volume</li>
	<li>Soft, Comfortable, Hypoallergenic Black or Clear Liquid-Silicone Skirt</li>
	<li>Frameless Design, Fits in BCD Pocket</li>
	<li>Folds-Up, Great back-Up Mask</li>
	<li>Single Safety Tempered Glass Lens Design</li>
	<li>Wide Field of View</li>
	<li>Black Silicone Skirt: Hunters and Photographers</li>
	<li>Clear Silicone Skirt: Provides Brightness</li>
	<li>Swivel Buckles, Easy to Adjust, Custom Fit</li>
	<li>Double Feathered Edge Skirt</li>
	<li>Large Easy to Reach One-Handed Nose Pocket for Ear Equalization</li>
	<li>Neoprene Comfort Strap</li>
	<li>Mask Strap Won''t Tangled Hair!</li>
	<li>Mask Box</li></ul>'
);

INSERT INTO product_detail VALUES(
	10,
	'FR',
	'<ul class="checkmark"><li>Conception à fenêtre unique avec lentille en verre trempé</li>
	<li>Faible volume et construction légère</li>
	<li>Large champ de visionJupe en silicone souple et confortable</li>
	<li>La sangle en néoprène empêche les cheveux de s''emmêler</li></ul>',
	'<p class="text-justify">C''est un simple masque d''ombre; Léger et peu volumineux, avec une jupe en silicone liquide noire ou claire, douce, confortable et hypoallergénique. Parce qu''il n''y a pas de cadre, la lentille unique de l''ombre se trouve près du visage, offrant un champ de vision inhabituellement large. De plus, comme il n''y a pas de cadre, le masque se replie dans un emballage soigné, suffisamment petit pour se glisser dans une poche BC, ce qui en fait un support facile à transporter. La jupe noire en silicone élimine la lumière venant des côtés, ce qui signifie que l''Ombre est un excellent masque pour les chasseurs et les photographes qui ont besoin de bien voir dans l''ombre. La version claire satisfera ceux qui préfèrent la transmission translucide de la lumière dans le masque.</P>
	<p class="text-justify">Le masque Shadow a des boucles qui pivotent et sont faciles à ajuster, permettant un ajustement personnalisé. Il est disponible en deux tailles adaptées à un large éventail de faces. La Shadow a une double jupe à bords aplatis pour une excellente étanchéité et une grande poche à une main facile à atteindre pour une égalisation de l''oreille qui fonctionne même avec des gants en néoprène épais. La lentille en verre trempé de sécurité unique offre une vue dégagée et le modèle Shadow inclut désormais une sangle confort en néoprène qui ne s''emmêle pas dans vos cheveux et la conception en caoutchouc néoprène doux augmente le confort. The Shadow est livré avec une boîte à masque.</P>',
	'<ul class="indent-disc"><li>Volume léger et faible</li>
	<li>Jupe douce, confortable, hypoallergénique noire ou en silicone liquide claire</li>
	<li>Conception sans cadre, compatible avec BCD Pocket</li>
	<li>Masque de sauvegarde super-pliable</li>
	<li>Conception de lentilles en verre trempé à sécurité unique</li>
	<li>Large champ de vision</li>
	<li>Jupe en silicone noir: chasseurs et photographes</li>
	<li>Jupe en silicone transparent: apporte de la luminosité</li>
	<li>Boucles pivotantes, faciles à ajuster, ajustement personnalisé</li>
	<li>Jupe à double bord à plumes</li>
	<li>Grande poche à une main facile à atteindre pour égaliser les oreilles</li>
	<li>Courroie de confort en néoprène</li>
	<li>La bandoulière ne va pas emmêler les cheveux!</li>
	<li>Boîte de masques</li></ul>'
);

INSERT INTO product_detail VALUES(
	11,
	'EN',
	'<ul class="checkmark"><li>2 window low profile design</li>
	<li>Tempered glass lenses for durability</li>
	<li>Reversed teardrop angled dual lens design</li>
	<li>Unique frame for superior panoramic vision</li>
	<li>Feathered skirt for a perfect seal on face</li></ul>',
	'<p class="text-justify">The Genesis LVX is a low volume mask that provides an extraordinary field of vision. With its reversed teardrop angled dual lenses, the diver''s vertical vision is immensely improved with an expanded downward view. Mask features a unique frame design for superior, panoramic vision. Finding a perfect fit is easy; the LVX with its double feathered edged crystal silicone rubber skirt combined with the wide split style mask strap will create the perfect seal on almost all faces. If you travel with your gear this mask is extremely light weight.</p>
	<p class="text-justify">Mask is equipped with easily adjusted ratcheted buckles and an easy-to-reach one hand nose pocket for ear equalization that can be utilized even when wearing thick gloves. As with any quality mask it is constructed with dual tempered safety glass lenses, is a low-profile design and provides extreme comfort and fit. Mask comes with a clear plastic mask box for added protection when in storage. The Genesis LVX Mask is available in multiple colors.</p>',
	'<ul class="indent-disc"><li>2 Window Low Profile Design</li>
	<li>Tempered Glass Lenses</li>
	<li>Reversed Teardrop Angled Dual Lens Design</li>
	<li>Unique Frame for Superior Panoramic Vision</li>
	<li>Lenses & Frame: Expanded Downward View</li>
	<li>Low Volume Mask</li>
	<li>Extremely Comfortable Fit</li>
	<li>Crystal Liquid Injected Silicone Skirt</li>
	<li>Double Feather-Edged Skirt</li>
	<li>Wide Split Style Silicone Strap</li>
	<li>Feathered Skirt & Wide Strap Design Combined for a Perfect Seal on Face</li>
	<li>Easy-to-Reach One-Hand Nose Pocket for Ear Equalization</li>
	<li>Easily Adjusted Ratcheting Buckles</li>
	<li>Protective Mask Box</li>
	<li>Available in Multiple Colors</li></ul>'
);

INSERT INTO product_detail VALUES(
	11,
	'FR',
	'<ul class="checkmark"><li>Conception de profil bas à 2 fenêtres</li>
	<li>Lentilles en verre trempé pour la durabilité</li>
	<li>Conception à double lentille inclinée en forme de goutte inversée</li>
	<li>Cadre unique pour une vision panoramique supérieure</li>
	<li>Jupe à plumes pour une parfaite étanchéité sur le visage</li></ul>',
	'<p class="text-justify">Le LVX de Genesis est un masque à faible volume qui offre un champ de vision extraordinaire. Avec ses doubles lentilles inclinées inversées en forme de goutte, la vision verticale du plongeur est considérablement améliorée avec une vue élargie vers le bas. Le masque présente un design de cadre unique pour une vision panoramique supérieure. Trouver un ajustement parfait est facile; La LVX, avec sa jupe en caoutchouc silicone à double tranchant et en silicone, associée à la sangle de masque large et divisée créera l''étanchéité parfaite sur presque tous les visages. Si vous voyagez avec votre équipement, ce masque est extrêmement léger.</P>
	<p class="text-justify">Le masque est équipé de boucles à cliquet facilement ajustables et d''une poche nasale facile à atteindre pour une égalisation de l''oreille qui peut être utilisée même avec des gants épais. Comme avec n''importe quel masque de qualité, il est construit avec des lentilles en verre de sécurité trempé, est un design discret et offre un confort et un ajustement extrêmes. Le masque est livré avec un masque en plastique transparent pour une protection accrue lors du stockage. Le masque LVX Genesis est disponible en plusieurs couleurs.</P>',
	'<ul class="indent-disc"><li>Conception de profil bas à 2 fenêtres</li>
	<li>Verres en verre trempé</li>
	<li>Conception à double lentille inclinée en forme de larme inversée</li>
	<li>Cadre unique pour une vision panoramique supérieure</li>
	<li>Objectifs et monture: vue vers le bas étendue</li>
	<li>Masque à faible volume</li>
	<li>Coupe extrêmement confortable</li>
	<li>Jupe en silicone injectée de cristaux</li>
	<li>Jupe à double tranchant</li>
	<li>Courroie en silicone large et fendue</li>
	<li>Jupe à plumes et conception à larges bretelles combinées pour un joint parfait sur le visage</li>
	<li>Poche de nez à une main, facile à atteindre, pour l''égalisation des oreilles</li>
	<li>Boucles à cliquet réglables facilement</li>
	<li>Boîte à masque de protection</li>
	<li>Disponible en plusieurs couleurs</li></ul>'
);

INSERT INTO product_detail VALUES(
	12,
	'EN',
	'<ul class="checkmark"><li>Freedom technology for fit and comfort</li>
	<li>Dual lens tempered front glass</li>
	<li>UV and anti reflective lens treatment</li>
	<li>3D wide split strap</li>
	<li>Tempered crystal view optical glass lenses</li></ul>',
	'<p class="text-justify">The TUSA''s Freedom One Mask is a low-profile low volume two window mask that features the newly developed and revolutionary freedom technology delivering superior fit, comfort and performance. The Freedom One Mask is one of the first next generation TUSA masks offering this innovative new technology combined with superior design, build quality, materials and frame construction. Freedom model masks feature a dimpled skirt surface with varied silicone thicknesses and stability ridges in addition to a proprietary low friction double feathered edge skirt surface on the fitting line.</p>
	<p class="text-justify">The quick adjust buckle system incorporates a newly-designed low-profile buckle into the black silicone rubber skirt of the mask. The result is a compact, lightweight, and technologically advanced mask design that can be easily and quickly adjusted for a perfect fit. TUSA''s round edge skirt features a proprietary round edge cross-sectionally shaped skirt. This rounded edge results in a soft fit that suppresses pressure and reduces creasing left on the face. The "planar fit, instead of linear fit" silicone skirt maintains great fit and unprecedented comfort, you won''t have ring-around-the-eyeballs" like with other masks.</p>
	<p class="text-justify">TUSA''s patented 3-D wide split strap is a true three-dimensional design that snugly fits against the head''s natural curvature. The 3-D strap offers unprecedented comfort and fit unlike standard flat mask straps. The Freedom Pro One Mask lenses are tempered CrystalView optical glass that provides superior clarity, color and transmission of light over standard glass lenses used by the competition. Up to 15% of available light can be lost with a standard glass lens due to impurities and reflectivity. TUSA''s CrystalView lenses transmit 92% of available light to the diver for clear crisp vision.</p>
	<p class="text-justify">The Freedom One Mask also has UV and anti-reflective (A/R) treated lenses. Increased exposure to UV light can damage the eyes especially in marine environments where reflectivity is high. TUSA''s UV lens treatment provides 100% protection from harmful UVA and UVB rays. Blocking 100% of the ultraviolet spectrum (under 400nm) provides greater eye protection without sacrificing light transmission or vision. Standard glass lenses can reflect up to 15% of available light reducing vision underwater. TUSA''s anti-reflective (A/R) lens treatment decreases internal and external reflected light. This reduction increases light transmission to 95% resulting in significantly enhanced color, clarity, contrast and better overall vision underwater.</p>
	<p class="text-justify">The Freedom One Mask has an easy to reach one hand nose pocket for ear equalization which can be utilized even when wearing thick gloves. Mask is available with an all-black silicone rubber skirt with a black or metallic dark red frame. Mask comes with a protective mask box.</p>
	<p class="text-justify">The TUSA Freedom One Mask is commonly used for Open Water Diving and more. One reason why the TUSA Freedom One Mask is popular is because of its Lens Quality.</p>',
	'<ul class="indent-disc"><li><b>TUSA Freedom One Mask:</b></li>
	<li>Low-Profile Low Volume Two Window Mask</li>
	<li><b>Revolutionary Freedom Technology:</b><br>Provides Superior Fit, Comfort and Performance<br>Superior Design, Built Quality, Materials and Frame Construction<br>Dimpled Skirt Surface with Varied Silicone Thicknesses<br>Stability Ridges</li>
	<li>Proprietary Low-Friction Double Feathered Edge Skirt Surface on Fitting Line</li>
	<li><b>Quick-Adjust Buckle System:</b><br>Newly-Designed Skirt Mounted Low-Profile Buckles<br>Easily-and-Quickly Adjusted for Perfect Fit<br>5-Position Strap Angle Adjustment<br> Micro-Adjustment Fine Tuning</li>
	<li>Compact, Lightweight, Technologically Advanced Mask Design</li>
	<li>Round Edge Skirt with Soft Fit Suppresses Pressure and Reduces Crease on Face</li>
	<li>Planar Fit, Instead of Linear Fit Won''t Leave "Ring-Around-the-Eyeballs"</li>
	<li><b>Patented 3-D Wide Split Strap:</b><br>Strap Snugly Fits Head''s Natural Curvature<br>3-D Strap for Unprecedented Comfort and Fit</li>
	<li>Easy-to-Reach One-Hand Nose Pocket for Ear Equalization</li>
	<li><b>Tempered CrystalView Optical Glass Lenses:</b><br>Superior Clarity, Color and Transmission of Light<br>TUSA''s CrystalView Lenses Transmit 92% of Available Light </li>
	<li>Clear Crisp Vision</li>
	<li><b>Anti-Reflective (A/R) Lens Treatment:</b><br>Standard Glass Lenses Reflect Up to 15% of Available Light Reducing Vision Underwater<br>TUSA''s Anti-Reflective (A/R) Lens Treatment;<br>Decreases Internal and External Reflected Light<br>Increases Light Transmission to 95%<br>Significantly Enhanced Color, Clarity, Contrast & Vision Underwater</li>
	<li><b>UV Lens Treatment:</b><br>TUSA''s UV Lens Treatment Provides 100% Protection from Harmful UVA and UVB Rays<br>Blocking 100% of Ultraviolet Spectrum (under 400nm)<br>Greater Eye Protection without Sacrificing Light Transmission or Vision</li>
	<li>All Black Silicone Rubber Skirt</li>
	<li>Multiple Frame Colors</li>
	<li>Protective Mask Box</li></ul>'
);

INSERT INTO product_detail VALUES(
	12,
	'FR',
	'<ul class="checkmark"><li>Technologie Freedom pour un ajustement et un confort optimaux</li>
	<li>Vitre avant trempée à double lentille</li>
	<li>Traitement anti-UV et anti-reflets</li>
	<li>Sangle large 3D</li>
	<li>Verres optiques en verre trempé</li></ul>',
	'<p class="text-justify">Le masque Freedom One de TUSA est un masque à deux fenêtres à faible volume et à profil bas, doté de la nouvelle technologie révolutionnaire de liberté offrant un ajustement, un confort et des performances supérieurs. Le masque Freedom One est l''un des premiers masques TUSA de nouvelle génération offrant cette nouvelle technologie innovante combinée à un design, une qualité de fabrication, des matériaux et une construction de châssis supérieurs. Les masques de modèle Freedom sont dotés d''une surface de jupe alvéolée avec des épaisseurs de silicone et des stries de stabilité variées, en plus d''une surface de jupe à bord doublé à double frottement exclusive sur la ligne de montage.</P>
	<p class="text-justify">Le système de boucle à réglage rapide incorpore une nouvelle boucle à profil bas dans la jupe en silicone noire du masque. Le résultat est une conception de masque compacte, légère et technologiquement avancée qui peut être facilement et rapidement ajustée pour un ajustement parfait. La jupe à bord arrondi de TUSA est dotée d''une jupe exclusive à bords arrondis. Ce bord arrondi permet un ajustement en douceur qui supprime la pression et réduit le froissement sur le visage. La jupe en silicone «ajustement planaire, au lieu de l''ajustement linéaire» maintient un ajustement parfait et un confort sans précédent. Vous n''aurez pas les yeux rivés comme les autres masques.</P>
	<p class="text-justify">La sangle large en trois dimensions brevetée de TUSA est un véritable design tridimensionnel qui s''adapte parfaitement à la courbure naturelle de la tête. La sangle 3-D offre un confort et un ajustement sans précédent, contrairement aux sangles à masque plat standard. Les verres Freedom Pro One Mask sont des verres optiques CrystalView trempés qui offrent une clarté, une couleur et une transmission de la lumière supérieures à celles des verres standard utilisés par les concurrents. Jusqu''à 15% de la lumière disponible peut être perdue avec une lentille en verre standard en raison des impuretés et de la réflectivité. Les lentilles CrystalView de TUSA transmettent 92% de la lumière disponible au plongeur pour une vision nette et nette.</P>
	<p class="text-justify">Le masque Freedom One a également des lentilles traitées anti-UV et anti-reflet (A /R). Une exposition accrue aux rayons UV peut endommager les yeux, en particulier dans les environnements marins où la réflectivité est élevée. Le traitement de lentille UV TUSA offre une protection à 100% contre les rayons UVA et UVB nocifs. Le blocage de 100% du spectre ultraviolet (moins de 400 nm) offre une meilleure protection des yeux sans sacrifier la transmission de la lumière ou la vision. Les lentilles en verre standard peuvent refléter jusqu''à 15% de la vision réductrice de la lumière disponible sous l''eau. Le traitement de lentille antireflet (A /R) de TUSA diminue la lumière réfléchie interne et externe. Cette réduction augmente la transmission de la lumière à 95%, ce qui améliore considérablement la couleur, la clarté, le contraste et une meilleure vision globale sous l''eau.</P>
	<p class="text-justify">Le masque Freedom One a une poche nasale facile à atteindre pour une égalisation des oreilles qui peut être utilisée même avec des gants épais. Le masque est disponible avec une jupe en caoutchouc silicone noir avec un cadre rouge foncé métallique ou noir. Le masque est livré avec une boîte de masque de protection.</P>
	<p class="text-justify">Le masque TUSA Freedom One est couramment utilisé pour la plongée en eau libre et plus encore. L''une des raisons de la popularité du masque TUSA Freedom One est sa qualité d''objectif.</p>',
	'<ul class="indent-disc"><li><b>Masque TUSA Freedom One:</b></li>
	<li>Masque à deux fenêtres à profil bas</li>
	<li><b>Technologie révolutionnaire de la liberté:</b><br>offre un ajustement, un confort et des performances supérieurs - Conception supérieure, qualité de construction, matériaux et structure - Surface de jupe alvéolée avec épaisseur de silicone variable<br>Stability Ridges</li>
	<li>Surface de jupe à bord plissé à double plis exclusive sur la ligne de montage</li>
	<li><b>Système de boucles à réglage rapide:</b><br>Boucles à profil bas montées sur jupe nouvellement conçues - Ajustement facile et rapide pour un ajustement parfait - Réglage de l''angle de la sangle à 5 positions< br>Réglage fin du micro-ajustement</li>
	<li>Conception de masque compacte, légère et technologiquement avancée</li>
	<li>Jupe à bord arrondi avec ajustement doux supprime la pression et réduit le pli sur le visage</li>
	<li>L''ajustement planaire au lieu de l''ajustement linéaire ne laissera pas "Ring-Around-the-Eye-Balls"</li>
	<li><b>Sangle large 3-D brevetée:</b>Sangle ajustée à la courbure naturelle et à la courbure 3-D de la tête pour un ajustement et un confort sans précédent</li>
	<li>Poche de nez à une main, facile à atteindre, pour l''égalisation des oreilles</li>
	<li><b>Verres optiques en verre trempé CrystalView:</b><br>Clarté, couleur et transmission de la lumière supérieures: les objectifs CrystalView de TUSA transmettent 92% de la lumière disponible</li>
	<li>Clear Crisp Vision</li>
	<li><b>Traitement des lentilles antireflet (A /R):</b><br>Les lentilles en verre standard reflètent jusqu''à 15% de la vision sous-marine disponible pour réduire la lumière. Anti-Reflective (A /R) de TUSA Traitement de la lentille,<br>Diminue la lumière réfléchie interne et externe - Augmente la transmission de la lumière à 95% - Amélioration significative de la couleur, de la clarté, du contraste et de la vision sous l''eau</li>
	<li><b>Traitement de la lentille UV:</b><br>Le traitement de la lentille UV de TUSA offre une protection à 100% contre les rayons UVA et UVB nocifs - Blocage de 100% du spectre ultraviolet (inférieur à 400 nm) sans sacrifier la transmission de la lumière ou la vision</li>
	<li>Jupe en caoutchouc silicone noir</li>
	<li>Plusieurs couleurs de cadres</li>
	<li>Boîte à masque de protection</li></ul>'
);

--###################################################################################

INSERT INTO product_detail VALUES(
	13,
	'EN',
	'<ul class="checkmark"><li>Dry top design eliminates water entry</li>
	<li>Lower purge valve for easy clearing</li>
	<li>Hypoallergenic and comfortable mouthpiece</li></ul>',
	'<p class="text-justify">The Cressi Supernova Dry Snorkel has an anti-splash end with a special valve that seals the tube as you dive, almost totally preventing the entrance of water when the snorkel is submerged. The lower end has a corrugated section that has a smooth internal bore which prevents trapping water inside the snorkel tube allowing excess water to quickly drain to the collection reservoir below. The corrugated section also quickly drops-away from the diver''s mouth when switching from the snorkel to the Scuba regulator.</p>
	<p class="text-justify">The special water collection r with its large elliptic one-way exhaust valve makes expelling excess water quick and easy. The replaceable angled mouthpiece and corrugated tube section are both made from hypoallergenic silicone adding comfort and function. A quick release snorkel keeper and ergonomic contoured shape make this one great snorkel. Snorkel is available in multiple colors.</p>',
	'<ul class="indent-disc"><li>Anti-Splash Top</li>
	<li>Special Valve Seals Tube when Submerged</li>
	<li>Dry Top Design</li>
	<li>Corrugated Smooth Bore Lower Tube, Won''t Trap Water!</li>
	<li>Excess Water Quickly Drain to Collection Reservoir</li>
	<li>Easy Clear Purge Valve</li>
	<li>Replaceable Angled Mouthpiece</li>
	<li>Hypoallergenic Silicone Mouthpiece & Corrugated Tube</li>
	<li>Quick Release Snorkel Keeper</li>
	<li>Ergonomic Contoured Shape</li>
	<li>Available in Multiple Color Choices</li></ul>'
);

INSERT INTO product_detail VALUES(
	13,
	'FR',
	'<ul class="checkmark"><li>La conception du dessus sec élimine l’entrée de l’eau</li>
	<li>Valve de purge inférieure pour faciliter le nettoyage</li>
	<li>Embout buccal hypoallergénique et confortable</li></ul>',
	'<p class="text-justify">Le Cressi Supernova Dry Snorkel possède une extrémité anti-éclaboussure avec une valve spéciale qui scelle le tube lorsque vous plongez, empêchant presque totalement l"entrée d"eau lorsque le tuba est immergé. L"extrémité inférieure comporte une section ondulée dotée d"un alésage interne lisse qui empêche le piégeage de l"eau à l"intérieur du tube tuba, permettant ainsi à l"excès d"eau de s"écouler rapidement vers le réservoir de collecte situé en dessous. La section ondulée se détache également rapidement de la bouche du plongeur lors du passage du tuba au régulateur de plongée.</P>
	<p class="text-justify">Grâce à sa grande soupape d"échappement elliptique à sens unique, la collecte d"eau spéciale permet d"expulser l"eau rapidement et facilement. L"embout coudé remplaçable et la section de tube ondulé sont tous deux fabriqués en silicone hypoallergénique pour un confort et une fonctionnalité accrus. Un gilet à dégagement rapide et une forme ergonomique profilée en font un excellent tuba. Snorkel est disponible en plusieurs couleurs.</P>',
	'<ul class="indent-disc"><li>Anti-Splash Top</li>
	<li>Tube de joints de soupape spécial lorsqu"il est immergé</li>
	<li>Dry Top Design</li>
	<li>Le tube inférieur à alésage lisse ondulé ne va pas piéger l’eau!</li>
	<li>L"eau en excès s"évacue rapidement vers le réservoir de collecte</li>
	<li>Valve de purge à effacement facile</li>
	<li>Embouchure angulaire remplaçable</li>
	<li>Embout en silicone hypoallergénique et tube ondulé</li>
	<li>Quick Release Snorkel Keeper</li>
	<li>Forme ergonomique profilée</li>
	<li>Disponible dans plusieurs choix de couleurs</li></ul>'
);

INSERT INTO product_detail VALUES(
	14,
	'EN',
	'<ul class="checkmark"><li>Streamlined design for optimum hydrodynamics</li>
	<li>Two drain system deflects water from airway</li>
	<li>Comfo-bite mouthpiece reduces jaw fatigue</li>
	<li>Flexible tube construction</li>
	<li>One way purge valve allows easy clearing</li></ul>',
	'<p class="text-justify">The Impulse 3 is more streamlined and higher performing than its predecessors, the Impulse and Impulse 2. Since its introduction in 1989, the Impulse Snorkels have been the bestselling snorkels in the world. The Impulse snorkels feature a patented design, with a patented upper valve, a two-drain system and Aqua Lung''s patented Comfo-Bite mouthpiece. The Impulse comes in Flex and Non-Flex versions. The Impulse 3 uses a two-valve system. If a wave breaks over the snorkel, the patented, upper, annular valve directs most of the water out before it even reaches the mouthpiece. Any water that does get past the annular valve drains out the lower valve. The reservoir located below the mouthpiece keeps breathing path clear of excess water. In the rare event that you need to clear the Impulse 3 Snorkel, almost no breath is needed, all it takes is an easy puff. Patented Comfo-bite mouthpieces, which does not require the user to clench their teeth, eliminate jaw fatigue. An optional, smaller size Comfo-bite is available. Comfo-bite mouthpieces are replaceable. The flex model allows the lower unit to drop away for use with a regulator Also available in a non-flex, standard version.</p>',
	'<ul class="indent-disc"><li>More Streamlined and Higher Performing-than-Its-Predecessors</li>
	<li>Introduced in 1989: Bestselling Snorkels In-the-World</li>
	<li>Patented Design, w/Patented Upper Valve</li>
	<li>Two-Drain System</li>
	<li>Patented Comfo-Bite Mouthpiece</li>
	<li>Flex and Non-Flex Versions</li>
	<li>Upper, Annular Valve Directs Most Water Out</li>
	<li>Reservoir Located Below Mouthpiece, Keeps Breathing Path Clear of Excess Water</li>
	<li>Lower Purge</li>
	<li>Patented Comfobite Mouthpieces</li>
	<li>Mouthpiece: No Need to Clench Teeth, Eliminate Jaw Fatigue</li>
	<li>Replaceable Mouthpiece Design</li></ul>'
);

INSERT INTO product_detail VALUES(
	14,
	'FR',
	'<ul class="checkmark"><li>Conception simplifiée pour une hydrodynamique optimale</li>
	<li>Deux systèmes de drainage dévient l’eau des voies aériennes</li>
	<li>L"embout buccal comfo réduit la fatigue de la mâchoire</li>
	<li>Construction de tube flexible</li>
	<li>La vanne de purge à sens unique permet de nettoyer facilement</li></ul>',
	'<p class="text-justify">L"Impulse 3 est plus performant et plus performant que ses prédécesseurs, l"Impulse et l"Impulse 2. Depuis son introduction en 1989, les Snorkels Impulse sont les meilleurs snorkels au monde. Les tubas Impulse présentent un design breveté, avec un clapet supérieur breveté, un système à deux évacuations et un embout breveté Comfo-Bite d"Aqua Lung. L"Impulse est disponible en versions Flex et Non-Flex. L"Impulse 3 utilise un système à deux soupapes. Si une vague se brise sur le tuba, la valve annulaire supérieure brevetée évacue la majeure partie de l"eau avant même d"atteindre l"embouchure. Toute eau qui passe au-delà de la valve annulaire évacue la valve inférieure. Le réservoir situé au-dessous de l"embout buccal permet de respirer sans excès d"eau. Dans les rares cas où vous devez effacer l"Impulse 3 Snorkel, presque aucune respiration n"est nécessaire, il suffit d"une bouffée facile. Les embouts brevetés Comfo-mors, qui ne nécessitent pas de serrer les dents, éliminent la fatigue des mâchoires. Une option Comfo-bite plus petite est disponible. Les embouchures Comfo-morsure sont remplaçables. Le modèle Flex permet à l’unité inférieure d’être utilisée avec un régulateur. Disponible également en version standard non flexible.</P>',
	'<ul class="indent-disc"><li>Plus performant et plus rationalisé que ses prédécesseurs</li>
	<li>Introduit en 1989: Snorkels Best-seller dans le monde</li>
	<li>Conception brevetée avec valve supérieure brevetée</li>
	<li>Système à deux drainages</li>
	<li>Embouchure brevetée Comfo-Bite</li>
	<li>Versions Flex et non-Flex</li>
	<li>La valve annulaire supérieure dirige la plupart des sorties d"eau</li>
	<li>Réservoir situé au-dessous de l"embout buccal, maintient le chemin respiratoire à l"abri de l"excès d"eau</li>
	<li>Lower Purge</li>
	<li>Embouchures brevetées Comfobite</li>
	<li>Embout buccal: pas besoin de serrer les dents, éliminer la fatigue de la mâchoire</li>
	<li>Conception de l"embout buccal remplaçable</li></ul>'
);

INSERT INTO product_detail VALUES(
	15,
	'EN',
	'<ul class="checkmark"><li>Semi dry snorkel minimizes water ingress</li>
	<li>Patented hyperdry purge system</li>
	<li>Ergonomically angled mouthpiece</li></ul>',
	'<p class="text-justify">The SP-170 Platina II Hyperdry Snorkel is TUSA''s premier semi-dry snorkel incorporating several features such as the patented Hyperdry System making this one of the most stylish and feature packed snorkels on the market. The Hyperdry System keeps the main tube dry by ejecting water through an independent escape pipe. This unique design utilizes the angle of the snorkel tube and the resilience of the water surface to eject water. The smooth internal bore corrugated lower tube (pipe) offers a more comfortable fit since it creates no load on the ergonomically angled mouthpiece, straightens out during diving and doesn''t get-in-the-way when switching from the snorkel to the Scuba regulator.</p>
	<p class="text-justify">The swivel adapter snorkel keeper makes it possible to slip the mask strap into the slit of the keeper with no hassles. The two part construction allows the snorkel to rotate and can be attached in a horizontal position and quickly detached from the mask if needed. The high flow purge used on TUSA snorkels offers a covered large diameter purge valve for simple, quick clearing, reducing the amount of water remaining in the mouthpiece in an instant. Snorkel is available in multiple colors, so there''s sure to be one to match your gear. Like your Scuba regulator the mouthpiece is replaceable to extend the life of the snorkel.</p>',
	'<ul class="indent-disc"><li>TUSA''s Premier Semi-Dry Snorkel</li>
	<li><b> Patented Hyperdry System: </b> <br> Keeps Main Tube Dry <br> Ejects Water through <br> Independent Escape Pipe </li>
	<li>Utilizes Angle of Snorkel Tube and Resilience of Water Surface to Eject</li>
	<li><b> Smooth Internal Bore Corrugated Lower Tube (pipe): </b> <br> Comfortable Fit, No-Load on Mouthpiece <br> Doesn''t Get-in-the-Way when Switching from Snorkel to Scuba Regulator</li>
	<li>Swivel Adapter Snorkel Keeper: Quickly-Detaches from Mask if Needed</li>
	<li>High Flow Purge Design: Large Diameter Purge Valve for Simple, Quick Clearing</li>
	<li>Replaceable Silicone Mouthpiece</li>
	<li>Mouthpiece Ergonomically Angled for Comfort and Fit</li>
	<li>Contoured Tube Snorkel</li>
	<li>Multiple Color Options</li></ul>'
);

INSERT INTO product_detail VALUES(
	15,
	'FR',
	'<ul class="checkmark"><li>Le tuba semi-sec minimise l''infiltration d''eau</li>
	<li>Système de purge hyperdry breveté</li>
	<li>Embouchure à angle ergonomique</li></ul>',
	'<p class="text-justify">Le SP-170 Platina II Hyperdry Snorkel est le premier tuba semi-sec de TUSA intégrant plusieurs fonctionnalités telles que le système Hyperdry breveté, ce qui en fait l"un des tubas les plus élégants et les plus complets du marché. Le système Hyperdry maintient le tube principal au sec en éjectant de l"eau à travers un tuyau d"échappement indépendant. Cette conception unique utilise l"angle du tube tuba et la résilience de la surface de l"eau pour éjecter de l"eau. Le tube inférieur ondulé à alésage intérieur lisse offre un ajustement plus confortable car il ne crée aucune charge sur l"embout coudé ergonomique, se redresse pendant la plongée et ne se déplace pas lorsque vous passez du tuba au régulateur de plongée.</p>
	<p class="text-justify">Le rétreint de l"adaptateur pivotant permet de glisser la gaine du masque dans la fente de la gâche sans problème. La construction en deux parties permet au tuba de tourner et peut être attaché horizontalement et se détacher rapidement du masque si nécessaire. La purge à haut débit utilisée sur les tubas TUSA offre une vanne de purge couverte de grand diamètre pour un nettoyage simple et rapide, réduisant la quantité d"eau restant dans l"embouchure en un instant. Snorkel est disponible en plusieurs couleurs, il y en a sûrement une qui correspond à votre équipement. Comme votre détendeur de plongée, l"embout buccal est remplaçable pour prolonger la durée de vie du tuba.</P>',
	'<ul class="indent-disc"><li>Plongée semi-sèche Premier TUSA</li>
	<li><b>Système Hyperdry breveté:</b>pour garder le tube principal sec et éjecter l''eau grâce au tuyau d''évacuation indépendant</li>
	<li>Utilise l''angle de tuba et la résilience de la surface de l''eau pour éjecter</li>
	<li><b>Tube inférieur ondulé à alésage interne lisse (tuyau):</b><br>Embout confortable sans embout pour embout buccal - ne permet pas de passer du tuba au plongeur Régulateur</li>
	<li>Adaptateur pivotant Snorkel Keeper: se détache rapidement du masque si nécessaire</li>
	<li>Conception de purge à haut débit: vanne de purge de grand diamètre pour une élimination simple et rapide</li>
	<li>Bec en silicone remplaçable</li>
	<li>Embout à angle ergonomique pour plus de confort et d"ajustement</li>
	<li>Tuba tubulaire profilé</li>
	<li>Options de plusieurs couleurs</li></ul>'
);

INSERT INTO product_detail VALUES(
	16,
	'EN',
	'<ul class="checkmark"><li>Upper valve guards against splashes</li>
	<li>One way purge valve for effortless clearing</li>
	<li>Hinged seal swings upward to seal the airway</li>
	<li>Comfortable and durable mouthpiece</li>
	<li>Angled mouthpiece fits comfortably in mouth</li></ul>',
	'<p class="text-justify">A dry snorkel that Really stays dry! Genesis Scuba''s exclusive valve and purge combination keep the Mojave snorkel dry as a bone! The upper valve guards against splashes and seals the tube while underwater. Silicone purge allows effortless clearing, and prevents water from seeping inside. A truly dry snorkel! When the Mojave snorkel is submersed, the uniquely designed, hinged seal swings upward to seal the airway. Water can''t get in! As you surface, the flap swings open allowing air to re-enter the tube. It''s that simple and that dry.</p>
	<p class="text-justify">When you are out snorkeling and want to surface dive to look at something that has caught your eye up close this dry snorkel seals out water when submerged. Once you return to the surface there is no need to blow into the snorkel to remove water because the dry valve kept it out of the breathing tube. The Mojave has a clear silicone flex tube and mouthpiece. The angled mouthpiece fits comfortably in your mouth for hours of snorkeling fun. The mouthpiece is also replaceable and can be removed easily when replacement is necessary. The flexible lower tube makes the Mojave perfect for Scuba by automatically swing out of the way when you are using your Scuba regulator.</p>
	<p class="text-justify">The deep reservoir lower mouthpiece section with its one-way purge valve makes clearing the snorkel quick and easy once you surface from a Scuba dive. The adjustable mask strap retainer clip will keep your snorkel perfectly adjusted and ready for use. Once you have completed your dive it also makes removal from the mask easy. The Genesis Mojave Dry Snorkel is available in multiple colors.</p>',
	'<ul class="indent-disc"><li>A Dry Snorkel that REALLY Stays Dry!</li>
	<li>Exclusive Valve & Purge Combination Keeps Mojave Snorkel Dry-As-a-Bone!</li>
	<li>Upper Valve Guards Against Splashes & Seals Tube while Underwater</li>
	<li>One-Way Silicone Purge Valve Allows Effortless Clearing</li>
	<li>A Truly DRY Snorkel!</li>
	<li>Contoured Tube Design</li>
	<li>When Submerged Hinged Seal Swings Upward-to-Seal Airway</li>
	<li>On Surface Flap Swings Open Allowing Air to Re-Enter Tube</li>
	<li>Clear Silicone Flex Tube and Mouthpiece</li>
	<li>Angled Mouthpiece Fits Comfortably in Mouth</li>
	<li>Replaceable Mouthpiece</li>
	<li>Flexible Lower Tube Automatically Swings Out of-the-Way for Scuba</li>
	<li>Deep Reservoir Below the Mouthpiece w/One-Way Purge Valve</li>
	<li>Clearing Snorkel is Quick and Easy</li>
	<li>Adjustable Mask Strap Retainer Clip</li>
	<li>Available in Multiple Colors</li></ul>'
);

INSERT INTO product_detail VALUES(
	16,
	'FR',
	'<ul class="checkmark"><li>Protège les clapets supérieurs contre les éclaboussures</li>
	<li>Valve de purge à sens unique pour un nettoyage sans effort</li>
	<li>Le joint articulé se relève pour sceller les voies respiratoires</li>
	<li>Embout confortable et durable</li>
	<li>Embout coudé se glisse facilement dans la bouche</li></ul>',
	'<p class="text-justify">Un tuba sec qui reste vraiment sec! La combinaison exclusive de valve et de purge de Genesis Scuba garde le tuba Mojave sec comme un os! La soupape supérieure protège contre les éclaboussures et scelle le tube sous l''eau. La purge au silicone permet un nettoyage sans effort et empêche l''eau de s''infiltrer à l''intérieur. Un tuba vraiment sec! Lorsque le tuba Mojave est submergé, le joint à charnière à la conception unique pivote vers le haut pour sceller les voies respiratoires. L''eau ne peut pas entrer! Au fur et à mesure que vous faites surface, le volet s''ouvre pour permettre à l''air de pénétrer de nouveau dans le tube. C''est aussi simple que ça et sec.</P>
	<p class="text-justify">Lorsque vous faites de la plongée en apnée et que vous voulez plonger en surface pour regarder quelque chose qui a attiré votre attention, ce tuba sec ferme l''eau lorsqu''il est immergé. Une fois que vous revenez à la surface, il n''est pas nécessaire de souffler dans le tuba pour enlever l''eau, car la valve sèche l''a maintenu hors du tube respiratoire. Le Mojave est doté d''un tube flexible en silicone et d''un embout buccal. L''embout coudé s''adapte confortablement dans votre bouche pour des heures de plongée en apnée. L''embout buccal est également remplaçable et peut être retiré facilement lorsqu''un remplacement est nécessaire. Le tube inférieur flexible rend le Mojave parfait pour Scuba en basculant automatiquement lorsque vous utilisez votre régulateur de plongée.</P>
	<p class="text-justify">La partie profonde de l''embouchure inférieure du réservoir avec sa vanne de purge à sens unique permet de nettoyer le tuba rapidement et facilement une fois que vous avez fait surface à partir d''une plongée de plongée. Le clip de retenue de la sangle de masque ajustable gardera votre tuba parfaitement ajusté et prêt à l''emploi. Une fois que vous avez terminé votre plongée, cela facilite également le retrait du masque. Le tuba sec de Genesis Mojave est disponible en plusieurs couleurs.</P>',
	'<ul class="indent-disc"><li>Un tuba sec qui reste vraiment sec!</li>
	<li>Combinaison de vannes et purges exclusive pour garder le tuba Mojave sec comme un os!</li>
	<li>Tube de protection supérieur contre les éclaboussures et les joints d''étanchéité sous l''eau</li>
	<li>La vanne de purge en silicone unidirectionnelle permet un effacement sans effort</li>
	<li>Un vrai tuba sec!</li>
	<li>Conception de tubes profilés</li>
	<li>Lorsque le phoque articulé submergé oscille entre les voies respiratoires supérieures et inférieures</li>
	<li>Les oscillations des rabats sur la surface permettent à l''air de ré-entrer dans le tube</li>
	<li>Tube et embout buccal en silicone transparent</li>
	<li>L''embout coudé s''adapte confortablement dans la bouche</li>
	<li>Embouchure remplaçable</li>
	<li>Le tube inférieur flexible oscille automatiquement pour la plongée sous-marine</li>
	<li>Réservoir profond sous l''embout buccal avec valve de purge à sens unique</li>
	<li>Effacer le tuba est simple et rapide</li>
	<li>Clip de retenue de sangle de masque ajustable</li>
	<li>Disponible en plusieurs couleurs</li></ul>'
);

INSERT INTO product_detail VALUES(
	17,
	'EN',
	'<ul class="checkmark"><li>Contoured design for effortless breathing</li>
	<li>Hydrodynamic shape for reduced drag</li>
	<li>Dry top design minimizes water entry</li>
	<li>Purge valve allows easy clearing of snorkel</li>
	<li>Soft, durable mouthpiece reduces jaw fatigue</li></ul>',
	'<p class="text-justify">The new ERGO snorkel family was designed for maximum performance both for scuba divers and snorkeler''s alike. From one end to the other, the ergonomic shape fits perfectly to the side of the head, a new contoured design for effortless breathing and efficient movement for greater comfort. The Hydrodynamic shape reduces drag both under and on the surface of the water.</p>
	<p class="text-justify">Snorkel comes with a corrugated flex lower tube made of high quality silicone which allows for any angle of use; the mouthpiece drops out of the way when not in use. During a dive will never be disturbed by the snorkel knocking against your regulator. It also features a snorkel keeper which can be adjusted in many positions. It also includes an exhaust valve in the mouthpiece for easy clearing. The mouthpiece is molded in soft rubber for greater shock and wear resistance, also to properly host the exhaust valve.</p>
	<p class="text-justify">Exclusive engineering of the dry top (patented) and an ergonomically correct mouthpiece make this the ideal snorkel for scuba or for prolonged snorkeling sessions. The combination of the 100% dry top and an exhaust valve in the mouthpiece ensures a completely dry breathing environment. Snorkel comes in three colors and is covered by a 24 month limited warranty.</p>',
	'<ul class="indent-disc"><li>Anatomical Design</li>
	<li>Easy Clear Exhaust Valve</li>
	<li>Corrugated Tube and Mouthpiece High Quality Silicone</li>
	<li>Great for Scuba and Snorkeling</li>
	<li>Dry Top Snorkel</li>
	<li>Adjustable Snorkel Keeper</li>
	<li>Maximum Performance for Scuba Divers and Snorkeler''s</li>
	<li>Hydrodynamic Contoured Tube Shape Reduces Drag</li>
	<li>Replaceable Mouthpiece Design</li></ul>'
);

INSERT INTO product_detail VALUES(
	17,
	'FR',
	'<ul class="checkmark"><li>Conception profilée pour une respiration sans effort</li>
	<li>Forme hydrodynamique pour une traînée réduite</li>
	<li>La conception du dessus sec minimise l''entrée d''eau</li>
	<li>La vanne de purge permet de nettoyer facilement le tuba</li>
	<li>Un embout doux et durable réduit la fatigue de la mâchoire</li></ul>',
	'<p class="text-justify">La nouvelle famille de tubas ERGO a été conçue pour offrir des performances optimales aux plongeurs comme aux plongeurs. D''un bout à l''autre, la forme ergonomique s''adapte parfaitement au côté de la tête, un nouveau design profilé pour une respiration sans effort et un mouvement efficace pour un plus grand confort. La forme hydrodynamique réduit la traînée sous et sur la surface de l''eau.</P>
	<p class="text-justify">Snorkel est livré avec un tube inférieur en carton ondulé en silicone de haute qualité qui permet un angle d''utilisation quelconque; l''embout buccal se dégage lorsqu''il n''est pas utilisé. Au cours d''une plongée ne sera jamais perturbé par le tuba qui frappe contre votre régulateur. Il dispose également d''un gardien de plongée qui peut être ajusté dans de nombreuses positions. Il comprend également une soupape d''échappement dans l''embout buccal pour faciliter le dégagement. L''embout buccal est moulé en caoutchouc souple pour une résistance accrue aux chocs et à l''usure, ainsi que pour accueillir correctement la soupape d''échappement.</P>
	<p class="text-justify">L''ingénierie exclusive de la partie supérieure (brevetée) et de l''embout ergonomique en fait le tuba idéal pour la plongée ou pour des sessions prolongées de plongée en apnée. La combinaison de la partie supérieure 100% sèche et d''une soupape d''échappement dans l''embout buccal garantit un environnement respiratoire complètement sec. Snorkel est disponible en trois couleurs et est couvert par une garantie limitée de 24 mois.</P>',
	'<ul class="indent-disc"><li>Conception anatomique</li>
	<li>Valve d''échappement facile à éliminer</li>
	<li>Silicone de haute qualité pour tubes et embouts ondulés</li>
	<li>Idéal pour la plongée sous-marine et la plongée en apnée</li>
	<li>Snorkel à sec</li>
	<li>Gardien de plongée ajustable</li>
	<li>Performances maximales pour Scuba Divers et Snorkeler''s</li>
	<li>La forme du tube profilé hydrodynamique réduit la traînée</li>
	<li>Conception de l''embout buccal remplaçable</li></ul>'
);

INSERT INTO product_detail VALUES(
	18,
	'EN',
	'<ul class="checkmark"><li>Semi dry top stops water entry into the tube</li>
	<li>Easy to clear</li>
	<li>Valve and tube keeps water away from mouth</li></ul>',
	'<p class="text-justify">Many divers won''t even dive with a snorkel, just look around on the next dive you take at the beach or out on the charter boat, very few snorkels. You also hear many divers on those dives complain about their short bottom times and want to know how to increase it for more fun. A snorkel is part of that answer. The amount of air a diver wastes on the surface breathing from their regulator drastically reduces the amount of air for the actual time they are underwater.</p>
	<p class="text-justify">A snorkel that is easy to clear is low in profile and one that stays dryer inside is what you are looking for. SV stand for Scupper Valve, also known as a one-way-valve. Just like the one-way-valve in your regulator which when you exhale drains water from your regulator the scupper valve basically works the same. The SV2 uses an additional feature that keeps water away from your mouth a small tube located just below the mouthpiece is designed to keep the breathing airway path free of water droplets. To keep water from easily entering the top of the snorkel the SV2 incorporates a grill grid opening which deflects water that would go down the end of a conventional snorkel tube. The flexible lower tube makes the Atomic SV2 Snorkel perfect for Scuba by automatically swinging out-of-the-way when you are using your Scuba regulator.  So, if you hate to use a snorkel, but want more bottom time this is the solution you are looking for. Snorkel comes with a quick-release snorkel keeper that has a 30° rotation/sliding adjuster and has a removable and replaceable silicone mouthpiece. The Atomic SV2 Semi-Dry Snorkel is available in multiple color choices.</p>',
	'<ul class="indent-disc"><li>Low Profile Design</li>
	<li>Easy to Clear</li>
	<li>Valve and Tube Keeps Water Away from Mouth</li>
	<li>Comfortable Removable Mouthpiece</li>
	<li>Semi-Dry Top</li>
	<li>Great in Choppy Water</li>
	<li>Prevents Wind Spray from Entering Tube</li>
	<li>Purge Valve in Lower End</li>
	<li>Corrugated Lower Tube</li>
	<li>Great Snorkel for Scuba</li>
	<li>Quick-Release Snorkel Keeper with 30° Rotation</li>
	<li>Snorkel Keeper has Sliding Adjuster</li>
	<li>Available in Multiple Colors</li></ul>'
);

INSERT INTO product_detail VALUES(
	18,
	'FR',
	'<ul class="checkmark"><li>Le couvercle semi-sec arrête l''entrée de l''eau dans le tube</li>
	<li>Facile à nettoyer</li>
	<li>La valve et le tube empêchent l''eau de pénétrer dans la bouche</li></ul>',
	'<p class="text-justify">De nombreux plongeurs ne plongent même pas avec un tuba, regardez simplement la prochaine plongée à la plage ou sur le bateau charter, très peu de tubas. Vous entendez également de nombreux plongeurs plongés sur ces plongées se plaindre de leurs temps de parcours plus courts et vouloir savoir comment les augmenter pour plus de plaisir. Un tuba fait partie de cette réponse. La quantité d''''air que le plongeur gaspille à la surface en respirant de son régulateur réduit considérablement la quantité d''''air pour la durée réelle de son passage sous l''eau.</P>
	<p class="text-justify">Un tuba facile à nettoyer est de faible profil et celui qui reste plus sec à l''intérieur est ce que vous recherchez. Socle SV pour Scupper Valve, également connu sous le nom de valve à sens unique. Tout comme la soupape à une voie de votre détendeur qui, lorsque vous expirez, évacue l''eau de votre détendeur, la soupape d''évacuation fonctionne de la même manière. Le SV2 utilise une fonction supplémentaire qui empêche l''eau de pénétrer dans votre bouche. Un petit tube situé juste en dessous de l''embout buccal est conçu pour maintenir le passage des voies respiratoires exempt de gouttelettes d''eau. Pour empêcher l''eau d''entrer facilement dans la partie supérieure du tuba, le SV2 intègre une ouverture de grille qui dévie l''eau qui descendrait à l''extrémité d''un tube tuba conventionnel. Le tube inférieur flexible rend le Atomic SV2 Snorkel parfait pour la plongée sous-marine en basculant automatiquement lorsque vous utilisez votre régulateur de plongée. Donc, si vous détestez utiliser un tuba, mais que vous voulez plus de temps, c''est la solution que vous recherchez. Snorkel est livré avec un gilet de sauvetage à dégagement rapide qui a un ajusteur de rotation /glissement de 30 ° et a un embout en silicone amovible et remplaçable. Le tuba semi-sec Atomic SV2 est disponible en plusieurs couleurs.</P>',
	'<ul class="indent-disc"><li>Conception de profil bas</li>
	<li>Facile à nettoyer</li>
	<li>La valve et le tube éloignent l''eau de la bouche</li>
	<li>Embouchure amovible confortable</li>
	<li>Dessus semi-sec</li>
	<li>Super dans l''eau agitée</li>
	<li>Empêche le vent de pénétrer dans le tube d''entrée</li>
	<li>Valve de purge à l''extrémité inférieure</li>
	<li>Tube inférieur ondulé</li>
	<li>Great Snorkel pour la plongée</li>
	<li>Keeper Snorkel à libération rapide avec rotation de 30 °</li>
	<li>Snorkel Keeper a un ajusteur coulissant</li>
	<li>Disponible en plusieurs couleurs</li></ul>'
);

INSERT INTO product_detail VALUES(
	19,
	'EN',
	'<ul class="checkmark"><li>J type snorkel</li>
	<li>Lightweignt and low profile</li>
	<li>Contoured to fit divers face</li>
	<li>TPE mouthpiece for comfort</li></ul>',
	'<p class="text-justify">Simple yet functional "J" snorkel is made entirely out of floating medical-grade thermoplastic elastomer (T. P. E.), rubber material. The design is lightweight and low-profile and valued priced for the budget minded dive enthusiast. The snorkels contoured flex barrel tube and comfortable T. E. P. mouthpiece fit to the diver''s face and is comfortable in the mouth. The Blue Reef Free Diving J-Style Snorkel is a great snorkel design for the free diver. Snorkel comes equipped with an easy-to-use quick-disconnect snorkel keeper, and is all black in color.</p>',
	'<ul class="indent-disc"><li>Simple, Functional "J" Style Snorkel</li>
	<li>Material: Floating Medical-Grade Thermoplastic Elastomer (T. P. E.), Rubber</li>
	<li>Lightweight and Low Profile</li>
	<li>Valued Priced for Budget Minded Dive Enthusiast</li>
	<li>Contoured Flex Barrel Tube</li>
	<li>Comfortable T. PE. E. Mouthpiece</li>
	<li>Snorkel Fit to Divers Face and is Comfortable in Mouth</li>
	<li>Easy-to-Use Quick-Disconnect Snorkel Keeper</li></ul>'
);

INSERT INTO product_detail VALUES(
	19,
	'FR',
	'<ul class="checkmark"><li>Jorkel de type J</li>
	<li>Lightweignt et low profile</li>
	<li>Contourné pour s''adapter aux plongeurs</li>
	<li>Embout TPE pour le confort</li></ul>',
	'<p class="text-justify">Le tuba en "J" simple mais fonctionnel est fabriqué entièrement en élastomère thermoplastique flottant de qualité médicale (T. P. E.), en caoutchouc. La conception est légère et discrète et son prix est estimé pour les amateurs de plongée soucieux de leur budget. Le tube tubulaire flexible du tuba et le confortable embout T. E. P. s''adaptent au visage du plongeur et sont confortables dans la bouche. Le Snorkel J-Style Blue Dive Free Diving est un excellent modèle de plongée libre pour le plongeur libre. Snorkel est équipé d''un dispositif de maintien en forme de tuba à déconnexion rapide facile à utiliser et de couleur noire.</P>',
	'<ul class="indent-disc"><li>Snorkel de style "J" simple et fonctionnel</li>
	<li>Matériel: élastomère thermoplastique flottant de qualité médicale (T. P. E.), caoutchouc</li>
	<li>Léger et profil bas</li>
	<li>Prix avantageux pour les adeptes de plongée soucieux de leur budget</li>
	<li>Tube de baril flexible profilé</li>
	<li>Confortable T. PE. E. Embouchure</li>
	<li>Snorkel Fit to Divers Face et est confortable dans la bouche</li>
	<li>Snorkel Keeper facile à utiliser et à déconnexion rapide</li></ul>'
);

INSERT INTO product_detail VALUES(
	20,
	'EN',
	'<ul class="checkmark"><li>Dry top snorkel design</li>
	<li>One way snorkel purge valve for clearing</li>
	<li>Corrugated lower section</li>
	<li>Large bore snorkel for better airflow</li>
	<li>Ergonomic regulator style mouthpiece</li></ul>',
	'<p class="text-justify">The perfect way to enjoy effortless breathing when snorkeling on the surface. The ideal snorkel is always within easy reach and ready to supply lots of dry airflow when it''s time to do some surface swimming. When not needed, it simply stays out of the way. Designed to be the perfect companion to Scubapro''s Spectra masks the restyled Spectra Dry is nothing if not the ideal snorkel. Its large-bore upper tube allows plenty of airflow, and its new dry top design actually seals the tube when the snorkel is submerged so no clearing is needed upon resurfacing. An efficient purge valve positioned at the lowest point of the snorkel expels any water that might make its way into the airway, preventing that annoying gurgling sensation you get when breathing off a "wet" snorkel.</p>
	<p class="text-justify">The lower corrugated portion of the tube is flexible so when you switch to your regulator the mouthpiece hangs down and out of the way. When you return to the surface and switch back to snorkel breathing, the regulator-style mouthpiece fits securely between the teeth, ensuring a comfortable fit no matter how long the swim back to the boat or the beach. The replaceable mouthpiece and the flexible tube are both made from high quality silicone. Snorkel comes equipped with a quick-connect clip makes it easy to attach or remove snorkel from mask strap.</p>',
	'<ul class="indent-disc"><li>Scubapro Spectra Dry Snorkel</li>
	<li>New Dry Top Design: Seals Tube w/Snorkel is Submerged</li>
	<li>One-Way Purge Valve for Easy Clearing</li>
	<li>Ergonomic Regulator Style Silicone Mouthpiece</li>
	<li>Mouthpiece is Replaceable</li>
	<li>Mouthpiece Reduces Jaw Fatigue and Discomfort</li>
	<li>Lower Corrugated Flex Tube Drops Out-of-the-Way when Switching to Scuba Regulator</li>
	<li>Large Bore Contoured Tube Provides Unrestrictive Breathing</li>
	<li>Contoured Tube Hugs Divers Head for Streamline Low Profile and Reduced Drag</li>
	<li>Quick-Connect Removable Clip Keeper</li>
	<li>Flexible Tube made from High Quality Silicone</li></ul>'
);

INSERT INTO product_detail VALUES(
	20,
	'FR',
	'<ul class="checkmark"><li>Conception du tuba supérieur sec</li>
	<li>Valve de purge tubulaire à sens unique pour le nettoyage</li>
	<li>Section inférieure ondulée</li>
	<li>Un tuba à grand diamètre pour une meilleure circulation d''air</li>
	<li>Embouchure ergonomique de type régulateur</li></ul>',
	'<p class="text-justify">Le moyen idéal de respirer sans effort lors de la plongée en apnée à la surface. Le tuba idéal est toujours à portée de main et prêt à fournir beaucoup de flux d''air sec au moment de nager en surface. Lorsqu''il n''est pas nécessaire, il reste simplement à l''écart. Conçu pour être le compagnon idéal des masques Spectra de Scubapro, le Spectra Dry restylé n''est rien d''autre que le tuba idéal. Son tube supérieur à grand alésage permet une bonne circulation d''air et sa nouvelle conception en tête sèche scelle le tube lorsque le tuba est immergé, de sorte qu''aucun dégagement n''est nécessaire lors du resurfaçage. Une soupape de purge efficace placée au point le plus bas du tuba expulse toute eau qui pourrait pénétrer dans les voies respiratoires, empêchant cette sensation de gargouillis ennuyeuse que vous ressentez en expirant un tuba "humide".</P>
	<p class="text-justify">La partie ondulée inférieure du tube est flexible, de sorte que lorsque vous passez à votre régulateur, l''embout buccal est suspendu. Lorsque vous revenez à la surface et que vous retournez à la respiration avec tuba, l''embout buccal de type régulateur se fixe solidement entre les dents, assurant un ajustement confortable, quelle que soit la durée de la nage vers le bateau ou la plage. L''embout buccal remplaçable et le tube flexible sont fabriqués à partir de silicone de haute qualité. Snorkel est équipé d''un clip à connexion rapide, il est facile d''attacher ou de retirer le tuba du bracelet.</P>',
	'<ul class="indent-disc"><li>Scubapro Spectra Dry Snorkel</li>
	<li>Nouveau modèle de dessus sec: le tube de joints avec tuba est submergé</li>
	<li>Soupape de purge à sens unique pour un nettoyage facile</li>
	<li>Embouchure en silicone de style régulateur ergonomique</li>
	<li>L''embout buccal est remplaçable</li>
	<li>L''embout buccal réduit la fatigue et l''inconfort de la mâchoire</li>
	<li>Baisse des gouttes de tube ondulé ondulées lors du passage au régulateur de plongée</li>
	<li>Le tube à gros contour d''alésage offre une respiration sans restriction</li>
	<li>Le tube profilé épouse la tête du plongeur pour rationaliser le profil bas et réduire la traînée</li>
	<li>Gestionnaire de clips amovibles à connexion rapide</li>
	<li>Tube flexible en silicone de haute qualité</li></ul>'
);

INSERT INTO product_detail VALUES(
	21,
	'EN',
	'<ul class="checkmark"><li>Full featured RGBM NITROX compute</li>
	<li>Air, nitrox and BT function modes</li>
	<li>36 hours memory capacity</li>
	<li>Smart, easy, and intuitive to use</li>
	<li>Two different gas mixtures during single dive</li></ul>',
	'<p class="text-justify">When Mares introduced the Puck Dive Computer on the market in 2008, it sent a shockwave rippling through the Industry: A super intuitive, easy to use, and full featured RGBM Nitrox computer at an extremely competitive price. Now Mares is doing it again. Though improving on the original concept was not easy, they did so by implementing a larger display in a slimmer design, then added upgradeable firmware and multi-gas capability. With all the bells and whistles, with no unnecessary frills, the Puck Pro Wrist Computer is what you''re looking for. The Puck Pro is the computer that can accompany you through years and years of diving adventures.</p>
	<p class="text-justify">The Puck Pro Wrist Computer uses Mares-Wienke RGBM (Reduced Gradient Bubbles Model) Algorithm. The RGBM considers the phenomenon of micro-bubbles to prevent their formation. In over 10,000 real dives monitored by Dr. Bruce Wienke in the Los Alamos laboratories, the formation of micro-bubbles has been studied and evaluated to better understand the mechanism behind how micro-bubbles are formed during a dive. Today it is the most evolved algorithm for reducing the formation of micro-bubbles without compromising dive times.</p>
	<p class="text-justify">The easy excess push button allows the diver to operate the computer in all conditions, even when wearing thick gloves. Navigating through the computer programs is extremely simple and very intuitive. There are three special function modes of air, nitrox and bottom time. The Puck Pro Computer has a maximum depth display of 492'' (150 meter), a memory capacity of 36-hours, runs on a user-replaceable 3-volt CR2450 lithium-ion battery, power indicator, and back lighting for low light conditions. Computer also has a plan mode display, can be used in both imperial or metric units, fresh or seawater settings, residual nitrogen reset, option to exclude audible alarms and uncontrolled ascents", has an ascent rate indicator and is fully altitude adjustable to The Puck Pro also has a watch, stopwatch, date and temperature functions, and the quartz clock Movement can be set in a 12 or 24-hour format. The Puck has an optional USB interface for logging dives on your PC, (see SKU: MRSPCDL2) PC interface, and logbook function that includes dive profile graphs at 5-second sampling rate.</p>
	<p class="text-justify">The Puck Pro knows that not all of us who dive are young and in peak condition, it address this with precautionary program settings that allow individual adjustment to more conservative dive profiles if needed. When you do multi-level, multiple dives during a single day or multiple dives over several days you can choose different setting levels to adjust your computer to a more conservative dive profile.</p>
	<p class="text-justify">The Puck Pro has superior display readability. To offer an easy-to-read display Mares produced a wide computer mineral glass display, with intense backlighting and high contrast. The computer featuring illuminated, oversized digits with special attention paid to maximize the viewing angle, to eliminate angular distortion and to always grant the best readability. The Puck Pro Computer comes with a durable rubber wrist strap and a comprehensive owner''s manual.</p>',
	'<ul class="indent-disc"><li>Super Intuitive, Easy-to-Use, and Full-Featured Computer</li>
	<li>Improving on Original Concept</li>
	<li>Larger-Display in Slimmer-Design</li>
	<li>Upgradeable Firmware and Multi-Gas Capability</li>
	<li>All-the-Bells-and-Whistles</li>
	<li>Precision Stopwatch</li>
	<li>Mares-Wienke RGBM (Reduced Gradient Bubbles Model) Algorithm</li>
	<li>Special Function Modes Air, Nitrox and Bottom Time</li>
	<li>Precautionary Programs Setting</li>
	<li>Plan Mode</li>
	<li>Backlighting</li>
	<li>Log Book</li>
	<li>Fresh Water/Sea Water Setting</li>
	<li>Residual Nitrogen Memory Reset</li>
	<li>User-Replaceable CR 2450 Lithium-Ion Battery</li>
	<li>Altitude Adjustable to 12,100'' (3,700 meters).</li>
	<li>Memory Capacity 36 Hours</li>
	<li>Superior Display Readability, Mineral Glass Crystal</li>
	<li>492'' (150 meters) Depth Rating</li>
	<li>Power Indicators</li>
	<li>Audible Alarms</li>
	<li>Watch, Date and Temperature Displays</li>
	<li>12/24 Hour Formats</li>
	<li>Two-Different Gas Mixtures During Single Dive</li>
	<li>Metric or Imperial Units of Measure</li>
	<li>Ascent Rate Indicator and Ascent Rate Digital Indicator</li>
	<li>Quartz Clock Movement</li>
	<li>Durable Rubber Wrist Strap</li>
	<li>Comprehensive Owner''s Manual</li>
	<li>Optional USB Interface for Logging Dives on PC</li></ul>'
);

INSERT INTO product_detail VALUES(
	21,
	'FR',
	'<ul class="checkmark"><li>Calcul NITROX RGBM complet</li>
	<li>Modes de fonctionnement air, nitrox et BT</li>
	<li>36 heures de capacité de mémoire</li>
	<li>Utilisation intelligente, simple et intuitive</li>
	<li>Deux mélanges de gaz différents lors d''une plongée simple</li></ul>',
	'<p class="text-justify">Lorsque Mares a lancé l''ordinateur de plongée Puck sur le marché en 2008, il a provoqué une onde de choc dans l''industrie: un ordinateur Nitrox RGBM super intuitif, facile à utiliser prix. Maintenant, Mares le fait encore. Bien que l''amélioration du concept d''origine n''ait pas été facile, ils l''ont fait en mettant en place un écran plus grand dans un design plus mince, puis en ajoutant un micrologiciel évolutif et une capacité multi-gaz. Avec toutes les fonctions, sans fioritures inutiles, l''ordinateur de poignet Puck Pro est ce que vous recherchez. Le Puck Pro est l''ordinateur qui peut vous accompagner pendant des années et des années d''aventures de plongée.</P>
	<p class="text-justify">Le poignet Puck Pro utilise l''algorithme Mares-Wienke RGBM (modèle à bulles à gradient réduit). Le RGBM considère le phénomène des micro-bulles pour empêcher leur formation. Dans plus de 10 000 plongées réelles suivies par le Dr Bruce Wienke dans les laboratoires de Los Alamos, la formation de micro-bulles a été étudiée et évaluée afin de mieux comprendre le mécanisme de formation des microbulles lors d''une plongée. Aujourd''hui, c''est l''algorithme le plus évolué pour réduire la formation de micro-bulles sans compromettre les temps de plongée.</P>
	<p class="text-justify">Le bouton poussoir facile à utiliser permet au plongeur de faire fonctionner l''ordinateur dans toutes les conditions, même avec des gants épais. La navigation dans les programmes informatiques est extrêmement simple et très intuitive. Il existe trois modes de fonction spéciaux d''air, de nitrox et de temps bas. L''ordinateur Puck Pro dispose d''un affichage de profondeur maximale de 150 mètres (492 ''), d''une capacité de mémoire de 36 heures, fonctionne sur une batterie lithium-ion CR2450 de 3 volts remplaçable par l''utilisateur, d''un indicateur d''alimentation et d''un éclairage arrière . L''ordinateur dispose également d''un affichage en mode plan, peut être utilisé en unités impériales ou métriques, paramètres d''eau douce ou d''eau de mer, réinitialisation de l''azote résiduel, option pour exclure les alarmes sonores et ascensions incontrôlées. Pro possède également une montre, un chronomètre, des fonctions de date et de température, et le mouvement de l''horloge à quartz peut être réglé sur un format 12 ou 24. Le Puck dispose d''une interface USB en option pour enregistrer les plongées sur votre PC Interface PC et fonction de journal de bord comprenant des graphiques de profil de plongée à un taux d''échantillonnage de 5 secondes.</P>
	<p class="text-justify">Le Puck Pro sait que nous ne sommes pas tous jeunes et en pleine forme, cela répond à des paramètres de précaution qui permettent, si nécessaire, d''adapter individuellement des profils de plongée plus conservateurs. Lorsque vous effectuez plusieurs plongées à plusieurs niveaux pendant une seule journée ou plusieurs plongées sur plusieurs jours, vous pouvez choisir différents niveaux de réglage pour ajuster votre ordinateur à un profil de plongée plus conservateur.</P>
	<p class="text-justify">La lisibilité du Puck Pro est supérieure. Pour offrir un affichage facile à lire, Mares a produit un grand écran en verre minéral, avec un contre-jour intense et un contraste élevé. L''ordinateur est doté de chiffres surdimensionnés et éclairés, avec une attention particulière pour maximiser l''angle de vue, éliminer la distorsion angulaire et garantir une lisibilité optimale. L''ordinateur Puck Pro est livré avec un bracelet en caoutchouc durable et un manuel d''utilisation complet.</P>',
	'<ul class="indent-disc"><li>Ordinateur super intuitif, facile à utiliser et complet</li>
	<li>Améliorer le concept d''origine</li>
	<li>Plus grand écran dans Slimmer-Design</li>
	<li>Mise à niveau du micrologiciel et capacité multi-gaz</li>
	<li>Tous les cloches et sifflets</li>
	<li>Chronomètre de précision</li>
	<li>Algorithme Mares-Wienke RGBM (modèle à bulles à gradient réduit)</li>
	<li>Modes de fonction spéciaux Air, Nitrox et heure de fin</li>
	<li>Paramétrage des programmes de précaution</li>
	<li>Mode Plan</li>
	<li>Rétroéclairage</li>
	<li>Journal de bord</li>
	<li>Réglage de l''eau douce /de l''eau de mer</li>
	<li>Réinitialiser la mémoire d''azote résiduel</li>
	<li>Batterie au lithium-ion CR 2450 remplaçable par l''utilisateur</li>
	<li>Altitude ajustable à 12 100 ''(3 700 mètres).</li>
	<li>Capacité de mémoire 36 heures</li>
	<li>Lisibilité d''affichage supérieure, cristal de verre minéral</li>
	<li>150 mètres (492 pi) de profondeur</li>
	<li>Indicateurs de puissance</li>
	<li>Alarmes sonores</li>
	<li>Affichage de la montre, de la date et de la température</li>
	<li>Formats 12/24 heures</li>
	<li>Mélanges de gaz à deux niveaux pendant une seule plongée</li>
	<li>Unités de mesure métriques ou impériales</li>
	<li>Indicateur de vitesse de remontée et indicateur numérique de vitesse de remontée</li>
	<li>Mouvement d''horloge à quartz</li>
	<li>Dragonne en caoutchouc durable</li>
	<li>Manuel du propriétaire complet</li>
	<li>Interface USB en option pour la journalisation des plongées sur PC</li></ul>'
);

INSERT INTO product_detail VALUES(
	22,
	'EN',
	'<ul class="checkmark"><li>Air, nitrox and gauge modes</li>
	<li>Edge to edge, high definition LCD screen</li>
	<li>RGBM algorithm, Bruce Wienke/Haldane model</li>
	<li>Versatile dive memory logbook</li>
	<li>Multiple dive safe decompression calculations</li></ul>',
	'<p class="text-justify">The Cressi Leonardo Wrist Computer is an Elegant Expression of a Simple and Functional Design, the Leonardo is a Must-Have for Divers entering the sport and those who just want to dive. " A Single Button Interface makes it Effortless to Program Air, Nitrox and Gauge Modes. Leonardo has a Large Edge-to-Edge, High-Definition LCD Screen that gives Large Numerical Displays in a Computer that is still compact and Travel-Friendly. The Leonardo''s Easy-to-See Battery Life Icon Indicator and its Distinct Audible Alarms Deliver Critical Information as well as Peace-of-Mind during the Dive.</p>
	<p class="text-justify">The Leonardo features a new Cressi RGBM Algorithm, created in conjunction with the expertise of Bruce Wienke and based on the Haldane model, integrated with RGBM factors. This Algorithm allows for Safe Decompression Calculations for Multiple Dives spread out over Multiple Days. The Leonardo computer by Cressi is a Multifunctional Instrument for Sport Diving. It will supply any wanted information on Depth, Dive Times, Decompression Status, Ascent Rate and Surface Interval Times between dives. Nitrogen Absorption and Release is Continuously Processed by its Sophisticated Software, taking into account the Quantity of Inert Gases in the different Mixtures which can be used. Such information is Displayed on the Instrument''s Large Display, thanks to the PCD (Priority Compartment Digit Display) System, allowing an Easy and Direct Dialogue" between the Diver and the Computer, ensuring a clear understanding of all the Data needed at any given time and a perfect readability in any situation. The computer is provided with Clock and Calendar, a versatile Dive Memory (logbook), as well as a Dive Simulator. The Mathematical Model of Leonardo can make Saturation and De-Saturation Computations of dives carried out both with air and with Nitrox, whose parameters can all be set: from the maximum allowed PO2 value between 17.4 and 23.2 psi (1.2 bar and 1.6 bar), to the mixture''s oxygen percentage (FO2) between 21% and 50% of O2. Additionally, the Instrument may be set by the user for either Imperial (feet) or Metric (meters) System. The Leonardo can also be fully re-set after each use, making it an excellent choice for rental departments.</p>
	<p class="text-justify">The Cressi Leonardo Dive Computer has an Operational Depth from 0'' to 393'' (0 to 120 meters), is Powered by a User Replaceable CR2430 3-Volt Battery, and is equipped with a 60 Dive (70 hour) Logbook Memory function. The Clock Function can be set in a 12/24 Hour Formats. The Computer is also Altitude Adjustable up to 12,139'' (3,700 meters) and has a Back Light Feature for Low Light Conditions. The Computer comes with a Comprehensive Owner''s Manual.</p>',
	'<ul class="indent-disc"><li>Elegant Expression of a Simple and Functional Design</li>
	<li>For Divers Who "Just-Want-to-Dive"</li>
	<li>Single Button Interface for Effortless Programming</li>
	<li>Modes: Air, Nitrox and Gauge</li>
	<li>Large Edge-to-Edge, High-Definition LCD Screen</li>
	<li>Large Numerical Displays</li>
	<li>Compact and Travel-Friendly</li>
	<li>Easy-to-See Battery Life Icon Indicator</li>
	<li>Distinct Audible Alarms</li>
	<li>Algorithm: RGBM Algorithm, Bruce Wienke/Haldane Model</li>
	<li>Safe Decompression Calculations for Multiple Dives Over Multiple Days</li>
	<li>Multifunctional Instrument for Sport Diving</li>
	<li>Depth, Dive Times, Decompression Status</li>
	<li>Ascent Rate and Surface Interval Times</li>
	<li>Nitrogen Absorption and Release is Continuously Processed</li>
	<li>PCD (Priority Compartment Digit Display) System</li>
	<li>Easy and Direct Dialogue" Between Diver and Computer</li>
	<li>Perfect Readability in Any Situation</li>
	<li>Clock, Calendar and Temperature</li>
	<li>12/24 Hour Formats</li>
	<li>Versatile Dive Memory (logbook): 60 Dives or 70 Hours On-Board Log</li>
	<li>Dive Simulator Function</li>
	<li>PO2 Value between 17.4 and 23.2 psi (1.2 bar and 1.6 bar)</li>
	<li>(FO2) between 21% and 50% of O2</li>
	<li>Imperial (feet) or Metric (meters) System Selectable</li>
	<li>Reset Function for Multiple Users</li>
	<li>Operational Depth: 0'' to 393'' (0 to 120 meters)</li>
	<li>User Replaceable CR2430 3-Volt Battery</li>
	<li>Altitude Adjustable Up to 12,139'' (3,700 meters)</li>
	<li>Back Light Feature for Low Light Conditions</li>
	<li>Comprehensive Owner''s Manual</li></ul>'
);

INSERT INTO product_detail VALUES(
	22,
	'FR',
	'<ul class="checkmark"><li>Modes air, nitrox et jauge</li>
	<li>Écran LCD haute définition bord à bord</li>
	<li>Algorithme RGBM, modèle Bruce Wienke /Haldane</li>
	<li>Journal de plongée polyvalent</li>
	<li>Calculs de décompression sécurisés pour plusieurs plongées</li></ul>',
	'<p class="text-justify">L''ordinateur de poignet Cressi Leonardo est une expression élégante d''un design simple et fonctionnel, le Leonardo est un outil indispensable pour les plongeurs qui entrent dans le sport et ceux qui veulent simplement plonger. "Une interface à bouton unique permet de programmer les modes Air, Nitrox et Gauge. Leonardo possède un grand écran LCD haute définition bord à bord qui offre de grands affichages numériques sur un ordinateur encore compact et convivial. L''indicateur de durée de vie de la batterie facile à voir de Leonardo et ses alarmes sonores distinctes fournissent des informations critiques ainsi que la tranquillité d''esprit pendant la plongée.</P>
	<p class="text-justify">Le Leonardo propose un nouvel algorithme Cressi RGBM, créé en collaboration avec l''expertise de Bruce Wienke et basé sur le modèle Haldane, intégré aux facteurs RGBM. Cet algorithme permet des calculs de décompression sécurisés pour plusieurs plongées réparties sur plusieurs jours. L''ordinateur Leonardo de Cressi est un instrument multifonctionnel pour la plongée sportive. Il fournira toutes les informations voulues sur la profondeur, les temps de plongée, l''état de décompression, la vitesse de remontée et les intervalles de surface entre les plongées. L''absorption et la libération d''azote sont traitées en continu par son logiciel sophistiqué, en tenant compte de la quantité de gaz inertes dans les différents mélanges pouvant être utilisés. Ces informations sont affichées sur le grand écran de l''instrument, grâce au système PCD (Priorité compartimentage numérique), permettant un dialogue facile et direct entre le plongeur et l''ordinateur, garantissant une compréhension claire de toutes les données nécessaires à un moment donné. une parfaite lisibilité dans toutes les situations L''ordinateur est fourni avec une horloge et un calendrier, une mémoire de plongée polyvalente (logbook), ainsi qu''un simulateur de plongée.Le modèle mathématique de Leonardo peut effectuer des calculs de saturation et de dé-saturation des plongées avec air et avec Nitrox, dont tous les paramètres peuvent être réglés: de la valeur maximale autorisée de PO2 comprise entre 17,4 et 23,2 psi (1,2 bar et 1,6 bar), au pourcentage d''oxygène du mélange (FO2) compris entre 21% et 50% d''O2. L''instrument peut être réglé par l''utilisateur pour un système impérial (pieds) ou métrique (mètres). Le Leonardo peut également être entièrement remis à zéro après chaque utilisation, ce qui en fait un excellent choix pour les services de location.</p>
	<p class="text-justify">L''ordinateur de plongée Cressi Leonardo a une profondeur opérationnelle de 0 à 120 mètres (0 à 393 pieds), est alimenté par une batterie 3 volts CR2430 remplaçable par l''utilisateur et est équipé Fonction plongée (70 heures) Journal. La fonction d''horloge peut être définie dans un format 12/24 heures. L''ordinateur est également réglable en altitude jusqu''à 3 139 mètres et dispose d''une fonction de rétroéclairage pour les conditions de faible luminosité. L''ordinateur est livré avec un manuel d''utilisation complet.</P>',
	'<ul class="indent-disc"><li>Expression élégante d''un design simple et fonctionnel</li>
	<li>Pour les plongeurs qui "veulent juste plonger"</li>
	<li>Interface à bouton unique pour une programmation sans effort</li>
	<li>Modes: Air, Nitrox et Jauge</li>
	<li>Grand écran LCD haute définition bord à bord</li>
	<li>Grands affichages numériques</li>
	<li>Compact et convivial pour les voyages</li>
	<li>Indicateur d''icône de durée de vie de la batterie facile à voir</li>
	<li>Alarmes sonores distinctes</li>
	<li>Algorithme: algorithme RGBM, Bruce Wienke /Modèle Haldane</li>
	<li>Calculs de décompression sécurisée pour plusieurs plongées sur plusieurs jours</li>
	<li>Instrument multifonctionnel pour la plongée sportive</li>
	<li>Profondeur, temps de plongée, état de décompression</li>
	<li>Taux d''ascension et intervalles de surface</li>
	<li>L''absorption et la libération de l''azote sont traitées en continu</li>
	<li>Système PCD (affichage de numéro de compartiment prioritaire)</li>
	<li>Dialogue facile et direct "entre plongeur et ordinateur</li>
	<li>Une lisibilité parfaite dans toutes les situations</li>
	<li>Horloge, calendrier et température</li>
	<li>Formats 12/24 heures</li>
	<li>Mémoire de plongée polyvalente (journal de bord): 60 plongées ou 70 heures de journal intégré</li>
	<li>Fonction du simulateur de plongée</li>
	<li>Valeur de PO2 entre 17,4 et 23,2 psi (1,2 bar et 1,6 bar)</li>
	<li>(FO2) entre 21% et 50% de O2</li>
	<li>Système impérial (pieds) ou métrique (mètres) sélectionnable</li>
	<li>Fonction de réinitialisation pour plusieurs utilisateurs</li>
	<li>Profondeur opérationnelle: 0 à 393 pieds (0 à 120 mètres)</li>
	<li>Batterie 3 volts remplaçable par l''utilisateur CR2430</li>
	<li>Altitude réglable jusqu''à 3 139 mètres</li>
	<li>Fonction de rétro-éclairage pour des conditions de faible luminosité</li>
	<li>Manuel du propriétaire complet</li></ul>'
);

INSERT INTO product_detail VALUES(
	23,
	'EN',
	'<ul class="checkmark"><li>Wrist mounted computer</li>
	<li>Operating modes: Air and Nitrox</li>
	<li>Programmable for 21% to 50% oxygen mixtures</li>
	<li>User replaceable Li-ion batteries</li>
	<li>Easy to read backlight display</li></ul>',
	'<p class="text-justify">The ZOOP Novo dive computer from Suunto is a wrist-mounted computer that will not only enhance your time under water; it will also help you be a safer diver without breaking the bank. Its ability to operate in two modes (Air and Nitrox), safety features (decompression stop data, audible alarms, and easy-to-read display), and simple menus mean the ZOOP Novo will provide critical dive data when it is needed quickly and accurately. It employs the reduced gradient bubble model (RGBM), which is an algorithm developed to calculate decompression stops; this algorithm is a model used to determine how much gas is accumulated during a dive and how much time is required at your safety stop(s) to safely surface.</p>
	<p class="text-justify">Suunto''s ZOOP Novo is PC-compatible, so you can easily store your dive data (up to 50 hours) and logs on a PC. It is activated by water, so you don''t have to worry about forgetting to start your computer and losing a single dive''s valuable data. Because this computer is wrist mounted, there''s never a need to search for your gauge console when you want to check on your depth, maximum bottom time, dive time, and no deco time. All of that information is available at a moment''s notice, right on your wrist In addition, the ZOOP Novo''s has a new back lite display which makes seeing your dive data easy during night and day dives.</p>
	<p class="text-justify">The ZOOP Novo provides a depth display to 330'' (100 meters), its clock can be set with a 12 or 24 hour format, provides temperature reading above and below the surface to 1.5° (1°C) accuracy and is altitude adjustable up to 10,000'' (3,000 meters). The computer can be programed for Nitrox mixtures from 21% to 50% oxygen and displays oxygen partial pressures from 17.4 psi to 23.2 psi (1.2 to 1.6 bars). The ZOOP Novo is powered by a user replaceable 3 volt CR2450 lithium ion battery. The ZOOP Novo can be set for imperial (feet) or metric (meter) measurements. The ZOOP Novo has an enlarged segment matrix screen, excellent contrast and information with bigger and clearer digits for depth, no-decompression etc., and a new 4 button interface for easier more intuitive diver use. Computer comes with a quick guide.</p>',
	'<ul class="indent-disc"><li>Wrist Mounted Computer</li>
	<li>Algorithm: Bruce R. Wienke, BS, MS and PhD, Reduced Gradient Bubble Model (RGBM)</li>
	<li>Operating Modes: Air, nitrox, gauge and freedive modes</li>
	<li>Programmable for 21% to 50% Oxygen Mixtures</li>
	<li>Displays Oxygen Partial Pressures from 17.4 psi to 23.2 psi (1.2 to 1.6 bars)</li>
	<li>Altitude Adjustable Up to 10,000'' (3,000 meters)</li>
	<li>Maximum Depth Display: 330'' (100 meters)</li>
	<li>12 or 24 Hour Clock Format</li>
	<li>Temperature Gauge to 1.5° (1°C) Accuracy</li>
	<li>Imperial/Metric Programmable</li>
	<li>Decompression Stop Data</li>
	<li>Audible Alarms</li>
	<li>50 Hour Profile and Logbook Memory</li>
	<li>User-Replaceable 3 Volt CR2450 Lithium-Ion Battery</li>
	<li>Back Lite Display, Easy to Read in Low Light & Night Conditions</li>
	<li>Enlarged Segment Matrix Screen</li>
	<li>Excellent Contrast & Information w/Bigger/Clearer Digits</li>
	<li>New 4 Button Interface</li>
	<li>Easier More Intuitive Diver Use</li>
	<li>PC Compatible</li>
	<li>Quick Guide</li></ul>'
);

INSERT INTO product_detail VALUES(
	23,
	'FR',
	'<ul class="checkmark"><li>Ordinateur monté sur le poignet</li>
	<li>Modes de fonctionnement: Air et Nitrox</li>
	<li>Programmable pour des mélanges d''oxygène de 21% à 50%</li>
	<li>Batteries Li-ion remplaçables par l''utilisateur</li>
	<li>Affichage du rétroéclairage facile à lire</li></ul>',
	'<p class="text-justify">L''ordinateur de plongée ZOOP Novo de Suunto est un ordinateur monté sur le poignet qui améliorera non seulement votre temps sous l''eau; cela vous aidera également à être un plongeur plus sûr sans vous ruiner. Sa capacité à fonctionner selon deux modes (Air et Nitrox), ses caractéristiques de sécurité (données de palier de décompression, alarmes sonores et affichage facile à lire) et ses menus simples signifient que ZOOP Novo fournira des données de plongée critiques rapidement et rapidement. avec précision. Il utilise le modèle à bulles à gradient réduit (RGBM), qui est un algorithme développé pour calculer les paliers de décompression; Cet algorithme est un modèle utilisé pour déterminer la quantité de gaz accumulée durant une plongée et le temps nécessaire à votre (vos) arrêt (s) de sécurité pour effectuer une surface sûre.</p>
	<p class="text-justify">Le ZOOP Novo de Suunto est compatible PC, ce qui vous permet de stocker facilement vos données de plongée (jusqu''à 50 heures) et de vous connecter à un PC. Il est activé par l''eau, vous n''avez donc pas à vous soucier d''oublier de démarrer votre ordinateur et de perdre les précieuses données d''une seule plongée. Étant donné que cet ordinateur est monté sur le poignet, il n''est jamais nécessaire de rechercher la console de votre jauge lorsque vous souhaitez vérifier la profondeur, le temps maximum, le temps de plongée et le temps de décompression. Toutes ces informations sont disponibles à tout moment, directement sur votre poignet. De plus, le ZOOP Novo dispose d''un nouvel écran rétro-éclairé qui facilite la visualisation de vos données de plongée pendant les plongées de nuit et de jour.</P>
	<p class="text-justify">Le ZOOP Novo fournit un affichage de profondeur à 100 mètres (330 ''), son horloge peut être réglée au format 12 ou 24 heures, fournissant une lecture de température au-dessus et au-dessous de la surface à 1,5 ° ( 1 ° C) précision et l''altitude réglable jusqu''à 10 000 pieds (3 000 mètres). L''ordinateur peut être programmé pour des mélanges de Nitrox de 21% à 50% d''oxygène et affiche des pressions partielles d''oxygène de 17,4 psi à 23,2 psi (1,2 à 1,6 bar). Le ZOOP Novo est alimenté par une batterie lithium-ion CR2450 de 3 volts remplaçable par l''utilisateur. Le ZOOP Novo peut être réglé pour des mesures impériales (pieds) ou métriques (mètres). Le ZOOP Novo dispose d''un écran matriciel élargi, d''un excellent contraste et d''informations avec des chiffres plus grands et plus clairs pour la profondeur, sans décompression, etc., et une nouvelle interface à 4 boutons pour une utilisation plus intuitive. L''ordinateur est livré avec un guide rapide.</P>',
	'<ul class="indent-disc"><li>Ordinateur monté sur le poignet</li>
	<li>Algorithme: Bruce R. Wienke, BS, MS et PhD, Modèle à bulles à gradient réduit (RGBM)</li>
	<li>Modes de fonctionnement: modes aérien, nitrox, jauge et libre</li>
	<li>Programmable pour 21% à 50% de mélanges d''oxygène</li>
	<li>Affiche les pressions partielles de l''oxygène de 17,4 psi à 23,2 psi (1,2 à 1,6 bar)</li>
	<li>Altitude ajustable Jusqu''à 10 000 ''(3 000 mètres)</li>
	<li>Affichage de la profondeur maximale: 100 mètres (330 '')</li>
	<li>Format d''horloge de 12 ou 24 heures</li>
	<li>Précision de la température à 1,5 ° (1 ° C) Précision</li>
	<li>Imperial /Metric Programmable</li>
	<li>Données d''arrêt de décompression</li>
	<li>Alarmes sonores</li>
	<li>Profil de 50 heures et mémoire de journal</li>
	<li>Batterie au lithium-ion CR2450 de 3 volts remplaçable par l''utilisateur</li>
	<li>Affichage rétro-éclairé, facile à lire en conditions de faible luminosité et de nuit</li>
	<li>Écran de matrice de segment agrandi</li>
	<li>Excellent contraste et information avec des chiffres plus grands /plus clairs</li>
	<li>Nouvelle interface à 4 boutons</li>
	<li>Utilisation plus intuitive et plus intuitive de la plongée</li>
	<li>Compatible PC</li>
	<li>Guide rapide</li></ul>'
);

INSERT INTO product_detail VALUES(
	24,
	'EN',
	'<ul class="checkmark"><li>Air, Nitrox, free dive, and gauge modes</li>
	<li>Nitrox mix up to 50% O2</li>
	<li>Salt or fresh water dive selection</li>
	<li>Water activated on switch</li>
	<li>Automatic altitude adjustment</li></ul>',
	'<p class="text-justify">Its effortless approach and versatility give you the ability to dive right in. It exceeds expectations with many features such as its easy-to-use interface, flexible operating modes, built-in backlight and user-changeable battery with data retention. The i300 carries all these features with a ruggedness that you can count on. And with effortless design, such as a water-activated on switch, it gets you right in the water and descending to your next adventure. 4 operating modes: Air, Nitrox, Gauge (with run timer), and Free Dive (tracks calculations to allow unrestricted switching between Dive and Free on same day). User-changeable standard battery and data retention. Maintains settings and calculations between battery changes. Backlighting for easy reading in low light. Audible alarms and additional high-visibility LED warning light for additional safety. User-updatable software gives access to the latest features and upgrade (must purchase optional download cable). Pre-Dive planning feature allows a preview of your next dive. Water-activated on switch, to give a no-worries start to the dive. Single button access to last dive display (max depth and bottom time). History Mode includes total number of dives, max depth, total dive hours, and lowest temperature. Computer has a depth readout to 330'' (100 m). Nitrox mix to 50% O2. Optional deep stop with countdown timer. Salt or fresh water dive selection. Automatic altitude adjustment ensures an accurate profile. Simple to use with DiverLog software on the Mac or PC platforms, which allows control of all your dive computer settings, view Log and Profile data, add location, notes and other details, as well as store and share photos & videos. DiverLog must be purchased separately at ediverlog.com. Included with the computer are a digital instruction manual, safety reference information, DiveLog brochure, quick reference card, lens protector and battery compartment opening tool.</p>',
	'<ul class="indent-disc"><li>Effortless Approach and Versatility</li>
	<li><b>Exceeds Expectations:</b><br>Easy-to-Use Interface<br>Flexible Operating Modes</li>
	<li>Built-In Backlight<br>User-Changeable Battery with Data Retention</li>
	<li>Ruggedness that You-Can-Count-On</li>
	<li>Water-Activated On-Switch: No-Worries Start to Dive</li>
	<li><b>4 Operating Modes:</b><br>Air, Nitrox, Gauge (with run timer)<br>Free Dive (tracks calculations to allow unrestricted switching between Dive and Free)</li>
	<li>Backlighting for Easy Reading in Low Light</li>
	<li>Audible Alarms & Additional High-Visibility LED Warning Light for Additional Safety</li>
	<li>User-Updatable Software</li>
	<li>Optional Download Cable: Access to Latest Features and Upgrade (see SKU: UDRPCI550)</li>
	<li>Pre-Dive Planning Feature Allows Preview of Next Dive</li>
	<li>Single Button Access to Last Dive Display (max depth and bottom time)</li>
	<li>History Mode: Total Number of Dives, Max Depth, Total Hours, & Lowest Temperature</li>
	<li>Depth Readout: 330'' (100 meters)</li>
	<li>Nitrox Mix to 50% O2</li>
	<li>Optional Deep Stop w/Countdown Timer</li>
	<li>Salt or Fresh Water Dive Selection</li>
	<li>Automatic Altitude Adjustment</li>
	<li>Simple to Use w/DiverLog Software on Mac or PC Platforms</li>
	<li><b>Control of All Dive Computer Settings:</b><br>View Log and Profile Data<br>Add Location, Notes and Other Details<br>Store and Share Photos & Videos</li>
	<li><b>Note:</b>DiverLog Must be Purchased Separately at ediverlog.com</li>
	<li><b>Includes:</b><br>Digital Instruction Manual<br>Safety Reference Info<br>DiverLog Brochure<br>Quick Reference Card<br>Lens Protector<br>Battery Compartment Opening Tool</li></ul>'
);

INSERT INTO product_detail VALUES(
	24,
	'FR',
	'<ul class="checkmark"><li>Modes air, nitrox, plongée libre et jauge</li>
	<li>Nitrox mélange jusqu''à 50% d''O2</li>
	<li>Sélection de plongée au sel ou à l''eau douce</li>
	<li>L''eau activée sur le commutateur</li>
	<li>Réglage automatique de l''altitude</li></ul>',
	'<p class="text-justify">Son approche sans effort et sa polyvalence vous permettent de plonger directement. Il dépasse les attentes grâce à de nombreuses fonctionnalités telles que son interface conviviale, ses modes de fonctionnement flexibles, son rétro-éclairage intégré et son utilisateur. batterie interchangeable avec conservation des données. Le i300 présente toutes ces caractéristiques avec une robustesse sur laquelle vous pouvez compter. Et avec un design sans effort, comme un interrupteur à eau activé, cela vous permet d''aller directement dans l''eau et de descendre à votre prochaine aventure. 4 modes de fonctionnement: Air, Nitrox, Gauge (avec minuterie) et Free Dive (suit les calculs pour permettre une commutation sans restriction entre Dive et Free le même jour). Batterie standard et mémoire de données modifiables par l''utilisateur. Conserve les paramètres et les calculs entre les changements de batterie. Rétro-éclairage pour une lecture facile en basse lumière. Des alarmes sonores et un témoin lumineux LED haute visibilité supplémentaire pour plus de sécurité. Un logiciel pouvant être mis à jour par l''utilisateur donne accès aux dernières fonctionnalités et à la mise à niveau (doit acheter un câble de téléchargement en option). La fonction de planification pré-plongée permet de visualiser votre prochaine plongée. Activé à l''eau sur l''interrupteur, pour donner un départ sans soucis à la plongée. Accès à un bouton unique pour le dernier affichage de plongée (profondeur maximale et temps inférieur). Le mode Historique comprend le nombre total de plongées, la profondeur maximale, le nombre total d''heures de plongée et la température la plus basse. L''ordinateur a une lecture en profondeur jusqu''à 100 m (330 ''). Mélange Nitrox à 50% d''O2. Arrêt en option avec compte à rebours. Sélection de plongée au sel ou à l''eau douce. Le réglage automatique de l''altitude garantit un profil précis. Simple à utiliser avec le logiciel DiverLog sur les plates-formes Mac ou PC, qui permet de contrôler tous les paramètres de votre ordinateur de plongée, d''afficher les données de journal et de profil, d''ajouter un emplacement, des notes et d''autres détails, et de stocker et partager des photos et des vidéos. DiverLog doit être acheté séparément sur ediverlog.com. Un manuel d''instructions numérique, des informations de référence sur la sécurité, une brochure DiveLog, une carte de référence rapide, un protecteur d''objectif et un outil d''ouverture du compartiment à batterie sont inclus avec l''ordinateur.</P>',
	'<ul class="indent-disc"><li>Approche sans effort et polyvalence</li>
	<li><b>Dépasse les attentes:</b>Interface facile à utiliser et modes de fonctionnement flexibles</li>
	<li>Rétro-éclairage intégré - Batterie interchangeable avec conservation des données</li>
	<li>Robustesse sur laquelle vous pouvez compter</li>
	<li>On-Switch activé par l''eau: les inquiétudes commencent à plonger</li>
	<li><b>4 modes de fonctionnement:</b><br>Air, Nitrox, Gauge (avec minuterie d''exécution)<br>Free Dive (suit les calculs pour permettre une commutation sans restriction entre Dive et Free)</li>
	<li>Rétroéclairage pour une lecture facile en faible éclairage</li>
	<li>Alarmes sonores et voyant d''avertissement supplémentaire à haute visibilité pour plus de sécurité</li>
	<li>Logiciel pouvant être mis à jour par l''utilisateur</li>
	<li>Câble de téléchargement facultatif: accès aux dernières fonctionnalités et mise à niveau (voir SKU: UDRPCI550)</li>
	<li>La fonction de planification pré-plongée permet de prévisualiser la prochaine plongée</li>
	<li>Accès par un seul bouton à l''affichage de la dernière plongée (profondeur maximale et heure inférieure)</li>
	<li>Mode historique: nombre total de plongées, profondeur maximale, nombre total d''heures et température la plus basse</li>
	<li>Lecture en profondeur: 100 mètres (330 '')</li>
	<li>Mélange Nitrox à 50% O2</li>
	<li>Option Deep Stop avec compte à rebours</li>
	<li>Sélection de plongée au sel ou à l''eau douce</li>
	<li>Réglage automatique de l''altitude</li>
	<li>Simple à utiliser avec les logiciels DiverLog sur les plates-formes Mac ou PC</li>
	<li><b>Contrôle de tous les paramètres de l''ordinateur de plongée:</b><br>Affichage des données de journal et de profil<br>Ajout de lieu, de notes et d''autres détails<br>Stockage et partage de photos et de vidéos</li>
	<li><b>Remarque:</b>DiverLog doit être acheté séparément sur ediverlog.com</li>
	<li><b>Comprend:</b><br>Manuel d''instructions numériques<br>Informations de référence sur la sécurité<br>Brochure DiverLog<br>Carte de référence rapide - Protecteur d''objectif<br>Outil d''ouverture de compartiment de batterie</li ></ul>'
);

INSERT INTO product_detail VALUES(
	25,
	'EN',
	'<ul class="checkmark"><li>Air/nitrox, Air Integrated Computer</li>
	<li>Air, nitrox or gauge operating modes</li>
	<li>3 gas Nitrox mixtures from 21% to 100%</li>
	<li>Modified Haldanean/DSAT dual algorithm</li>
	<li>Side reading compass for gun-sight accuracy</li></ul>',
	'<p class="text-justify">No more squinting. Dive Computers are supposed to deliver crucial data quickly and w/o confusion. Oceanic agrees. That''s why the Pro-Plus 3 combines a huge display area, the largest most legible digits on the market and an intuitive user interface w/major feature enhancement. See it for yourself. Take the Oceanic challenge: When shopping for a new dive computer, compare the displays. When it comes to viewing critical information, which would you rather see at 100'' (30 meters)?</p>',
	'<ul class="indent-disc"><li>Complete Instrumentation Console</li>
	<li>Includes Precision Navigation</li>
	<li><b>Pro-Plus 3 Air/Nitrox, Air Integrated Computer:</b></li>
	<li>Huge Display Area, Largest Most Legible Digits on the Market!</li>
	<li>Intuitive User Interface</li>
	<li>Air Time Remaining (ATR)</li>
	<li>ATR: Calculates Current Depth, Tank Pressure, Breathing Rate, Ascent Time, and Decompression Status</li>
	<li>Dive Time Remaining (DTR)</li>
	<li>DTR: Calculation Combines Air Time Remaining, Nitrogen and Oxygen Absorption</li>
	<li>Push-Button or Automatic Activation</li>
	<li>Audible Alarms with Flashing LED Warning Light and Acknowledgment</li>
	<li>User-Customized Audible Alarms</li>
	<li>Operating Modes: Air, Nitrox or Gauge</li>
	<li>3 Gas Nitrox Mixtures from 21% to 100%</li>
	<li>Dual Algorithm: Modified Haldanean / DSAT (Diving Science and Technology) Database / Z+</li>
	<li>The Ultimate Adjustable Algorithm"</li>
	<li>Graphic User Interface: Recognizable Logic of Green, Yellow and Red Color-Coding Bar Graphs</li>
	<li><b>Compass:</b></li>
	<li>Reliable Underwater Navigation</li>
	<li>Large, Easy-to-Read Bearing Indicators</li>
	<li>Great in Limited Visibility</li>
	<li>Liquid Filled Compass</li>
	<li>Top and Side Reading Capabilities</li>
	<li>Side Reading for Gun-Sight Accuracy</li>
	<li>High Visibility Lubber Line</li>
	<li>Large Ratcheting Bezel with Direction and Reciprocal Index Points</li>
	<li>Luminescent Display</li>
	<li>Precision Jeweled Bearing</li>
	<li>Strong Magnets for Quick Response and Accuracy</li></ul>'
);

INSERT INTO product_detail VALUES(
	25,
	'FR',
	'<ul class="checkmark"><li>Air /nitrox, ordinateur Air intégré</li>
	<li>Modes de fonctionnement air, nitrox ou jauge</li>
	<li>3 mélanges de Nitrox gazeux de 21% à 100%</li>
	<li>Algorithme double Haldanean /DSAT modifié</li>
	<li>Boussole de lecture latérale pour la précision du viseur</li></ul>',
	'<p class="text-justify">Plus de strabisme. Les ordinateurs de plongée sont censés fournir des données cruciales rapidement et sans confusion. Oceanic est d''accord. C''est pourquoi le Pro-Plus 3 combine une vaste zone d''affichage, les chiffres les plus lisibles du marché et une interface utilisateur intuitive avec une amélioration majeure des fonctionnalités. Voir par vous-même. Relevez le défi océanique: lorsque vous magasinez pour un nouvel ordinateur de plongée, comparez les écrans. En ce qui concerne l''affichage d''informations critiques, que préférez-vous voir à 100 mètres (30 mètres)?</P>',
	'<ul class="indent-disc"><li>Console d''instrumentation complète</li>
	<li>Inclut la navigation de précision</li>
	<li><b>Ordinateur intégré Air /Nitrox Pro-Plus 3:</b></li>
	<li>Grande surface d''affichage, chiffres les plus lisibles du marché!</li>
	<li>Interface utilisateur intuitive</li>
	<li>Temps d''antenne restant (ATR)</li>
	<li>ATR: calcule la profondeur actuelle, la pression du réservoir, la fréquence respiratoire, la durée d''ascension et l''état de décompression</li>
	<li>Temps de plongée restant (DTR)</li>
	<li>DTR: le calcul combine l''absorption du temps d''air, l''absorption de l''azote et de l''oxygène</li>
	<li>Activation par bouton poussoir ou automatique</li>
	<li>Alarmes sonores avec voyant lumineux clignotant et accusé de réception</li>
	<li>Alarmes sonores personnalisées par l''utilisateur</li>
	<li>Modes de fonctionnement: air, nitrox ou jauge</li>
	<li>3 mélanges de nitrox gazeux de 21% à 100%</li>
	<li>Double algorithme: base de données Haldanean /DSAT (science et technologie de la plongée) modifiée /Z +</li>
	<li>L''algorithme ajustable ultime "</li>
	<li>Interface utilisateur graphique: Logique reconnaissable des graphiques à barres de codage couleur vert, jaune et rouge</li>
	<li><b>Compass:</b></li>
	<li>Navigation sous-marine fiable</li>
	<li>Indicateurs de portance faciles à lire</li>
	<li>Excellente visibilité limitée</li>
	<li>Boussole remplie de liquide</li>
	<li>Capacités de lecture supérieure et latérale</li>
	<li>Lecture latérale pour la précision de la visée du canon</li>
	<li>Ligne de lubrification haute visibilité</li>
	<li>Grand cadre à cliquet avec direction et points d''index réciproques</li>
	<li>Affichage luminescent</li>
	<li>Palier de précision</li>
	<li>Aimants puissants pour une réponse et une précision rapides</li></ul>'
);

INSERT INTO product_detail VALUES(
	26,
	'EN',
	'<ul class="checkmark"><li>Complete Instrumentation Console</li>
	<li>Exceptionally Intuitive Display</li>
	<li>Air/Nitrox or Gauge Operating Mode</li>
	<li>Compass fro Navigation</li></ul>',
	'<p class="text-justify">Genesis ReSource Pro In-Line Computer Console has a pressure gauge that reads pressure up to 5000 psi w/temp, the ReSource Computer and an oil filled compass. Pressure Gauge is 1.75" (44.5 mm) diameter with excellent luminescent color graphics which makes reading your pressure easy at a glance. The compass features top and side reading view, this compass has been designed to give you excellent navigation.</p>
	<p class="text-justify">The ReSource Pro with Modified Haldanean / DSAT (Diving Science and Technology) Database Algorithm, has an intuitive operation and display, with large easy to read numbers and a clean matter-of-fact screen that gives you what you need to know. Computer can be used for air and nitrox diving and has a gauge mode option. The module measures 1" (25.4 mm) thick by 2.1" (53.34 mm) in diameter.</p>
	<p class="text-justify">The ReSource Pro can be programmed easily operate in either imperial or metric measurements. The computer is water activated so there is no need to turn it on before you jump in the water. The computer has a common CR2450 consumer replaceable battery, guaranteeing you won''t be on a once in a lifetime tropical vacation with a computer that needs factory battery replacement. Computer can log up to 50 dives in its memory, so not to worry on a day-by-day bases when you''re on vacation having fun, just wait to you get home. Night diving is aided with the HydroGlow back lighting which also comes in handy when on a cave or wreck diving adventure. If altitude diving is your thing the computer automatically adjust up to 14, 000'' (4267.2 meters). Maximum operational depth is 330'' (100 meters), there is an automatic safety stop countdown timer and full decompression stop countdowns as deep as 40'' (12.2 meters) when required. Computer has both digital and bar graph indicators for nitrogen, oxygen limits and ascent rate.</p>',
	'<ul class="indent-disc"><li>Complete Instrumentation Console</li>
	<li>Owner''s Manual and Battery Hatch Key</li>
	<li><b>Computer:Genesis ReSource Pro</b></li>
	<li>Air/Nitrox or Gauge Operating Mode</li>
	<li>Algorithm: Modified Haldanean / DSAT (Diving Science and Technology) Database</li>
	<li>Deep Stop Reminder for Dives-Exceeding 80'' (24.4 meters)</li>
	<li>Digital and Bar Graph Indicators for Nitrogen, Oxygen Limits & Ascent Rate</li>
	<li>Log Book Data: Up to 50 Dives</li>
	<li><b>Dive Mode:</b><br>Dive Time Remaining (NDL)<br>Current Depth<br>Bar Graph Indicating<br>Nitrogen Load<br>Bar Graph Indicating Current Ascent Rate</li>
	<li><b>Log Mode:</b><br>Log Mode Indicator<br>Maximum Depth<br>Elapsed Dive Time<br>Bar Graph Indicating Nitrogen Load at End of Dive<br>Bar Graph Indicating Maximum Ascent Rate - Last Dive</li>
	<li><b>Deco Mode:</b><br>Bar Graph Indicating Deepest Stop Depth Required<br>Total Ascent Time Indicated<br>Stop Time and Depth of Stop<br>Current Depth Indicated<br>Up Arrow Indicating Need to Ascend to Stop Depth</li>
	<li><b>Pressure Gauge:</b></li>
	<li>360° Rotational Swivel Assembly</li>
	<li>0-5000 psi Gauge Readout</li>
	<li>Temperature Gauge</li>
	<li>High Visibility Graphics</li>
	<li>Luminescent Dial</li>
	<li><b>Strategic Color Coded for Added Safety:</b><br>Red Safety Reserve 0 to 500 psi<br>Yellow 500 to 1,000 psi for Extended Reserve Air for Deeper Dives<br>Blue above 1,000 to 5,000 psi</li>
	<li>Shock Resistant Bourdon Tube Mechanism</li>
	<li>Gauge Case: Tough Glass-Filled Noryl</li>
	<li>Gauge Face (Lens): Durable Lexan</li>
	<li>Bright Red Temperature Gauge Needle for Ease-of-Reading</li>
	<li>32" (81.3 cm) High Pressure Hose with 7/16" Threads</li>
	<li><b>Compass:</b></li>
	<li>Reliable Underwater Navigation</li>
	<li>Large, Easy-to-Read Bearing Indicators</li>
	<li>Great in Limited Visibility</li>
	<li>Liquid Filled Compass</li>
	<li>Top and Side Reading Capabilities</li>
	<li>Side Reading for Gun-Sight Accuracy</li>
	<li>High Visibility Lubber Line</li>
	<li>Large Ratcheting Bezel with Direction and Reciprocal Index Points</li>
	<li>Luminescent Display</li>
	<li>Precision Jeweled Bearing</li>
	<li>Strong Magnets for Quick Response and Accuracy</li>
	<li>Compass Headings in 30° Numbered Increments</li>
	<li>Indicator Marks for Every 10°</li></ul>'
);

INSERT INTO product_detail VALUES(
	26,
	'FR',
	'<ul class="checkmark"><li>Console d''instrumentation complète</li>
	<li>Affichage exceptionnellement intuitif</li>
	<li>Mode de fonctionnement Air /Nitrox ou Gauge</li>
	<li>Compass pour la navigation</li></ul>',
	'<p class="text-justify">La console d''ordinateur en ligne ReSource Pro de Genesis est dotée d''un manomètre qui lit la pression jusqu''à 5000 psi w /temp, l''ordinateur ReSource et une boussole remplie d''huile. La jauge de pression a un diamètre de 1,75 "(44,5 mm) avec d''excellentes images couleur luminescentes qui facilitent la lecture de votre pression en un coup d''œil. La boussole est dotée d''une vue de lecture supérieure et latérale,
	<p class="text-justify">Le logiciel ReSource Pro avec algorithme de base de données Haldanean /DSAT (Diving Science and Technology) a un fonctionnement et un affichage intuitifs, avec de gros chiffres faciles à lire et un écran vous donne ce que vous devez savoir. L''ordinateur peut être utilisé pour la plongée à l''air et au nitrox et dispose d''une option de mode de jauge. Le module mesure 1 "(25,4 mm) d''épaisseur et 2,1" (53,34 mm) de diamètre.</P>
	<p class="text-justify">ReSource Pro peut être programmé pour fonctionner facilement en mesures impériales ou métriques. L''ordinateur est activé par l''eau, il n''est donc pas nécessaire de l''allumer avant de sauter dans l''eau. L''ordinateur est équipé d''une batterie CR2450 remplaçable par l''utilisateur, ce qui vous garantit de ne pas passer des vacances tropicales exceptionnelles avec un ordinateur qui nécessite le remplacement de la batterie en usine. L''ordinateur peut enregistrer jusqu''à 50 plongées dans sa mémoire, alors ne vous inquiétez pas lorsque vous êtes en vacances lorsque vous êtes en vacances, attendez simplement de rentrer à la maison. La plongée de nuit est facilitée par l''éclairage arrière HydroGlow, qui est également très pratique lors d''une aventure de plongée dans une grotte ou une épave. Si la plongée en altitude est votre truc, l''ordinateur ajuste automatiquement jusqu''à 14 000 ''(4267,2 mètres). La profondeur de fonctionnement maximale est de 100 mètres (330 pieds), il y a un compte à rebours d''arrêt de sécurité automatique et un compte à rebours de décompression complet jusqu''à 12,2 mètres (40 pieds) de profondeur si nécessaire. L''ordinateur possède des indicateurs numériques et graphiques à barres pour l''azote, les limites d''oxygène et la vitesse de remontée.</P>',
	'<ul class="indent-disc"><li>Console d''instrumentation complète</li>
	<li>Manuel du propriétaire et clé de verrouillage de la batterie</li>
	<li><b>Ordinateur: Genesis ReSource Pro</b></li>
	<li>Mode de fonctionnement Air /Nitrox ou Gauge</li>
	<li>Algorithme: base de données modifiée Haldanean /DSAT (Diving Science and Technology)</li>
	<li>Rappel d''arrêt profond pour des plongées dépassant 80 ''(24,4 mètres)</li>
	<li>Indicateurs numériques et graphiques à barres pour l''azote, les limites d''oxygène et la vitesse de remontée</li>
	<li>Données du journal: jusqu''à 50 plongées</li>
	<li><b>Mode Plongée:</b><br>Temps de plongée restant (NDL) - Profondeur actuelle - Graphique à barres indiquant la charge d''azote<br>Graphique à barres indiquant le taux de remontée actuel</li >
	<li><b>Mode de journalisation:</b><br>Indicateur du mode de journalisation<br>Profondeur maximale du temps de plongée écoulé<br>Graphique à barres indiquant la charge d''azote en fin de plongée<br>Graphique à barres indiquant l''ascension maximale Taux - Dernière plongée</li>
	<li><b>Mode déco:</b><br>Graphique à barres indiquant la profondeur d''arrêt maximale requise: temps total d''ascension indiqué<br>Temps d''arrêt et profondeur d''arrêt - Profondeur actuelle indiquée - Flèche vers le haut Indication de la nécessité de monter pour arrêter la profondeur</li>
	<li><b>Jauge de pression:</b></li>
	<li>Assemblage pivotant à 360 °</li>
	<li>0-5000 psi Gauge Readout</li>
	<li>Jauge de température</li>
	<li>Graphiques haute visibilité</li>
	<li>Cadran luminescent</li>
	<li><b>Code couleur stratégique pour plus de sécurité:</b><br>Réserve rouge de sécurité de 0 à 500 psi<br>Jaune 500 à 1 000 psi pour l''air prolongé de réserve pour plongées plus profondes - Bleu supérieur à 1 000 à 5 000 psi</li>
	<li>Mécanisme de tube de Bourdon résistant aux chocs</li>
	<li>Étui de jauge: Noryl rempli de verre dur</li>
	<li>Gauge Face (Lens): Lexan durable</li>
	<li>Aiguille de jauge de température rouge vif pour une lecture facile</li>
	<li>Tuyau haute pression de 81,3 cm (32 ") avec filetage 7/16"</li>
	<li><b>Compass:</b></li>
	<li>Navigation sous-marine fiable</li>
	<li>Indicateurs de portance faciles à lire</li>
	<li>Excellente visibilité limitée</li>
	<li>Boussole remplie de liquide</li>
	<li>Capacités de lecture supérieure et latérale</li>
	<li>Lecture latérale pour la précision de la visée du canon</li>
	<li>Ligne de lubrification haute visibilité</li>
	<li>Grand cadre à cliquet avec direction et points d''index réciproques</li>
	<li>Affichage luminescent</li>
	<li>Palier de précision</li>
	<li>Aimants puissants pour une réponse et une précision rapides</li>
	<li>En-têtes de boussole par incréments numérotés de 30 °</li>
	<li>Marques indicatrices pour chaque 10 °</li></ul>'
);

--###################################################################################

INSERT INTO product_detail VALUES(
	27,
	'EN',
	'<ul class="checkmark"><li>Traditional jacket style BCD</li>
	<li>Adjustable shoulder straps for a custom fit</li>
	<li>3-D designed air cell for better stability</li>
	<li>MiniPac cylinder mounting provide dual mounts</li>
	<li>Power inflator system</li></ul>',
	'<p class="text-justify">The AVID CQR·3 features an updated weight release system providing more convenience and ease when installing and removing the pockets. The redesigned styling of the traditional jacket-style AVID maintains its respected functionality, comfort and dependability. The AVID CQR·3 is a natural progression in Sherwood''s forward-moving product development.</p>
	<p class="text-justify">This jacket-style BC wraps air completely around you for easy floating. When fully inflated, the 3-D air cell and the suspension strap system combines to create a stable and secure fit that is designed to eliminate squeeze. BC is equipped with six convenient, stainless steel D-rings to attach your gear and zippered utility side pockets for additional scuba accessories. A convenient utility pocket with hook and loop closure sized to carry the Akona Safety Tube (SKU: AKNST). A removable and adjustable sternum strap for a complete fit and an easy to operate oral and power inflator makes buoyancy control a snap when diving.</p>
	<p class="text-justify">Three dump valves strategically located at the left and right shoulders with a third on the lower left of the air cell make dumping air a breeze. The right and lower dump/overpressure relief- valves have pull dump handles for quick access. The third valve is integrated to the top of the Sherwood power inflator and is activate by a cable running down the corrugated inflator hose. The AVID CQR 3 BCD is available in multiple sizes with a lift capacity of 20 to 36 lbs. (9 to 16.3 kg). The air cell is manufactured with durable and heavy-duty 1000 Denier that is urethane laminated for air tight integrity.</p>',
	'<ul class="indent-disc"><li>CQR 3 Weight System</li>
	<li>Adjustable Shoulder Straps for Better Fit</li>
	<li>3-D Designed Air Cell that Wraps around the Body for Exceptional Stability</li>
	<li>Suspension Strap Promotes Air Cell Movement, Preventing Squeeze</li>
	<li>Utility Zippered Side Pockets for Additional Scuba Accessories</li>
	<li>Removable and Adjustable Sternum Strap</li>
	<li>Rear Lower Vent Valve Releases Unwanted Air, while Descending</li>
	<li>Right Shoulder Vent Valve for Convenient Buoyancy Control</li>
	<li>Weight Integrated Design: Releasable XS to 3XL 16 lbs. to 26 lbs. (7.26 kg to 11.8kg)</li>
	<li>Two Non-Releasing Trim Weight Pockets for Enhanced Stability, 10 lbs. (4.5 kg)</li>
	<li>Custom Pocket for Optional Akona Safety Tube</li>
	<li>Mini-Pac Cylinder Mounting System Provides Dual Mounts</li>
	<li>High Lift in All Sizes: XS to 3XL 20 lbs. to 36 lbs. (9 kg to 16.3 kg)</li>
	<li>Sherwood Power Inflator with Cable Activated Pull Dump</li>
	<li>3/8" Threaded Low Pressure Hose with Quick-Disconnect Coupling</li>
	<li>Owner''s Manual</li></ul>'
);

INSERT INTO product_detail VALUES(
	27,
	'FR',
	'<ul class="checkmark"><li>Style de veste traditionnel BCD</li>
	<li>Bretelles réglables pour un ajustement personnalisé</li>
	<li>Cellule à air conçue en 3D pour une meilleure stabilité</li>
	<li>Le montage du vérin MiniPac fournit des supports doubles</li>
	<li>Système d''inflateur électrique</li></ul>',
	'<p class="text-justify">L''AVID CQR · 3 est doté d''un système de libération de poids mis à jour qui offre plus de commodité et de facilité lors de l''installation et du retrait des poches. Le style redessiné de l''AVID traditionnel en forme de veste conserve sa fonctionnalité, son confort et sa fiabilité respectés. L''AVID CQR · 3 est une progression naturelle dans le développement de produits en évolution constante de Sherwood.</P>
	<p class="text-justify">Ce modèle BC de style veste enveloppe complètement l''air autour de vous pour un flottement facile. Lorsqu''elle est complètement gonflée, la cellule d''air 3-D et le système de sangle de suspension se combinent pour créer un ajustement stable et sécurisé conçu pour éliminer la compression. BC est équipé de six anneaux en D en acier inoxydable pratiques pour attacher votre équipement et des poches latérales utilitaires à glissière pour des accessoires de plongée supplémentaires. Une poche utilitaire pratique avec fermeture auto-agrippante pour transporter le tube de sécurité Akona (SKU: AKNST). Une sangle de poitrine amovible et réglable pour un ajustement complet et un gonfleur oral et électrique facile à utiliser font de la flottabilité un contrôle instantané lors de la plongée.</P>
	<p class="text-justify">Trois vannes placées stratégiquement à gauche et à droite des épaules, dont une troisième en bas à gauche de la cellule pneumatique, rendent l''évacuation de l''air très facile. Les soupapes de décharge à surpression /surpression à droite et à la baisse ont des poignées de vidage pour un accès rapide. La troisième soupape est intégrée à la partie supérieure du gonfleur Sherwood et est activée par un câble descendant du tuyau de gonflage ondulé. L''AVID CQR 3 BCD est disponible en plusieurs tailles avec une capacité de levage de 20 à 36 livres. (9 à 16,3 kg). La cellule à air est fabriquée avec 1000 deniers durables et résistants à l''uréthane pour une étanchéité à l''air.</P>',
	'<ul class="indent-disc"><li>Système de pondération CQR 3</li>
	<li>Bretelles réglables pour un meilleur ajustement</li>
	<li>Une cellule à air conçue en 3D qui s''enroule autour du corps pour une stabilité exceptionnelle</li>
	<li>La sangle de suspension favorise le mouvement des cellules de l''air, empêchant la compression</li>
	<li>Pochettes latérales utilitaires à glissière pour accessoires de plongée supplémentaires</li>
	<li>Sangle de sternum amovible et ajustable</li>
	<li>La soupape de ventilation inférieure arrière libère de l''air indésirable pendant la descente</li>
	<li>Soupape d''évacuation à épaulement droit pour un contrôle de la flottabilité pratique</li>
	<li>Poids Conception intégrée: XS libérable à 3XL 16 lb. à 26 lbs. (7,26 kg à 11,8 kg)</li>
	<li>Deux poches de poids non relâchées pour une meilleure stabilité, 10 lb. (4,5 kg)</li>
	<li>Poche personnalisée pour tube de sécurité optionnel Akona</li>
	<li>Le système de montage de cylindre Mini-Pac fournit des supports doubles</li>
	<li>High Lift dans toutes les tailles: XS à 3XL 20 lbs. à 36 lbs. (9 kg à 16,3 kg)</li>
	<li>Inflateur de puissance Sherwood avec décharge de traction activée par câble</li>
	<li>Tuyau à basse pression fileté de 3/8 "avec raccord rapide</li>
	<li>Manuel du propriétaire</li></ul>'
);

INSERT INTO product_detail VALUES(
	28,
	'EN',
	'<ul class="checkmark"><li>Backmounted design</li>
	<li>Supports single or double tanks</li>
	<li>Mono-plate backpack</li>
	<li>Mares slide and lock system</li>
	<li>420 Cordura material</li></ul>',
	'<p class="text-justify">The streamlined Pure BCD offers swivel shoulder buckles, smart trim weight positioning and maximum adjustability. A great BC! Great for travel. The Mares Pure SLS BCD is a giant step in the evolution of back mounted BCDs. The first thing you will notice when donning the Pure SLS BCD is the perfect fit. This new level of comfort is achieved via special shoulder pads which are longer, pre-shaped and reinforced, and which work in perfect unison with the lumbar suspension system. This suspension system is inspired by the design of modern hiking backpacks; the system avoids direct contact between the body and the tank support. Bolt SLS BCD features 7 stainless steel D-rings for complete accessory attachment. Made of very tough 420 Cordura material, it will endure any exposure you submit it to and hold up to the test of time.</p>
	<p class="text-justify">Air-cell is separated from the harness, resulting in unrestricted freedom of movement. The bladder is equipped with bungee cords that will aid in a low profile when it is inflated and facilitates rapid deflation when dumping air. BCD comes standard with 3 pull-dump/overpressure relief valves, one is incorporated into the top of the Ergo Inflator; another is located on the right shoulder and a third is located on the rear lower right. Activation of the valves are made easy with both the upper and lower right valves coming with pull cords and the valve incorporated into the Ergo Inflator is activated by an internal cable attached to the inflator mechanism. Mares Ergo Inflator the standard inflation and deflation control device used in sanctioned training programs. Intuitive use and secure grip. The Ergo Inflator comes standard with a 3/8" threaded low pressure quick-disconnect hose.</p>',
	'<ul class="indent-disc"><li>Superbly Comfortable and Streamlined</li>
	<li>Great for Travel</li>
	<li>Giant Step in Evolution of Back Mounted BCDs</li>
	<li>Provides a Perfect Fit</li>
	<li><b> New Level of Comfort: </b> <br> Achieved via Special Shoulder Pads <br> Longer, Pre-Shaped and Reinforced <br> Work in Perfect Unison w/Lumbar Suspension System <br> Suspension System Inspired by Modern Hiking Backpacks <br> Avoids Direct Contact Between Body and Tank Support</li>
	<li>7 Stainless Steel D-Rings for Complete Accessory Attachment</li>
	<li>Tough 420 Cordura Material, Endure Exposure Submitted, Holds-Up to Test of Time</li>
	<li>Air-Cell Separated from the Harness, Unrestricted Freedom of Movement</li>
	<li>Bungee Cords: Aid in Low Profile w/Inflated, Facilitates Rapid Deflation</li>
	<li><b> 3 Pull-Dump/Overpressure Relief Valves: </b> <br> One Incorporated into Top of Ergo Inflator <br> One On Right Shoulder <br> Third Located on Rear Lower Right of Bladder <br> Easy Activation; Pull Cords and Cable Activated Ergo Inflator Valve</li>
	<li><b> Mares Ergo Inflator: </b> <br> Used in Sanctioned Training Programs <br> Intuitive Use & Secure Grip <br> Comes w/ 3/8" Threaded LP Quick-Disconnect Hose</li>
	<li><b> Mares Slide & Lock System (SLS): </b> <br> Ultimate Weight-Release System <br> Visual Confirmation of Proper Weight Pouch Insertion <br> No Guessing in Pre-Dive Gear Check <br> Weight Capacities of 9 lbs. and 13 lbs. (4 kg and 6 kg), Size Dependent <br> Sturdy Zipper Closures <br> Rear Smart Trim Weight Non-Releasable Pockets</li>
	<li>Weight: 8.6 lbs. (3.9 kg), Size Large</li>
	<li>Owner''s Manual</li></ul>'
);

INSERT INTO product_detail VALUES(
	28,
	'FR',
	'<ul class="checkmark"><li>Conception montée en arrière</li>
	<li>Supporte les réservoirs simples ou doubles</li>
	<li>Sac à dos mono-plaque</li>
	<li>Système de diapositives et de verrous Mares</li>
	<li>420 Matériel Cordura</li></ul>',
	'<p class="text-justify">Le Pure BCD simplifié offre des boucles d''épaule pivotantes, un positionnement intelligent du poids et une capacité de réglage maximale. Un super BC! Idéal pour les voyages. Le Mares Pure SLS BCD est un pas de géant dans l''évolution des gilets stabilisateurs montés à l''arrière. La première chose que vous remarquerez lorsque vous portez le Pure SLS BCD est l''ajustement parfait. Ce nouveau niveau de confort est atteint grâce à des épaulettes spéciales, plus longues, préformées et renforcées, qui travaillent en parfaite harmonie avec le système de suspension lombaire. Ce système de suspension s''inspire du design des sacs à dos de randonnée modernes; le système évite le contact direct entre le corps et le support du réservoir. Le boulon SLS BCD dispose de 7 anneaux en D en acier inoxydable pour un accessoire complet. Fabriqué avec un matériau 420 Cordura très résistant, il supportera toutes les expositions que vous lui soumettez et résiste à l''épreuve du temps.</P>
	<p class="text-justify">La cellule à air est séparée du harnais, ce qui permet une liberté de mouvement illimitée. La vessie est équipée de cordes élastiques qui facilitent un profil bas lorsqu''elle est gonflée et facilite le dégonflage lors du déversement d''air. Le BCD est livré en standard avec 3 soupapes de surpression et de surpression, l''une étant intégrée dans la partie supérieure du gonfleur Ergo; un autre est situé sur l''épaule droite et un troisième est situé à l''arrière inférieur droit. L''activation des vannes est facilitée par la présence de cordons de traction dans les vannes supérieure et inférieure droite, et la vanne intégrée dans le gonfleur Ergo est activée par un câble interne relié au mécanisme de gonflage. Mares Ergo Inflator est le dispositif de contrôle standard de gonflage et de dégonflage utilisé dans les programmes de formation autorisés. Utilisation intuitive et prise en main sûre. Le gonfleur Ergo est livré en standard avec un tuyau de 3/8 "à raccord rapide à faible pression fileté.</P>',
	'<ul class="indent-disc"><li>Superbement confortable et rationalisé</li>
	<li>Idéal pour les voyages</li>
	<li>Un pas de géant dans l''évolution des BCD montés en arrière</li>
	<li>Fournit un ajustement parfait</li>
	<li><b>Un nouveau niveau de confort:</b><br>grâce à des épaulettes spéciales: un système de suspension plus long, préformé et renforcé, parfait pour un système unitaire avec suspension lombaire et système de suspension Inspiré par les sacs à dos de randonnée modernes - Évite le contact direct entre le soutien du corps et du réservoir</li>
	<li>7 anneaux en D en acier inoxydable pour la fixation complète des accessoires</li>
	<li>Matériau résistant 420 Cordura, exposition permanente soumise à un test de temps</li>
	<li>Cellule aérienne séparée du harnais, liberté de mouvement illimitée</li>
	<li>Bungee Cords: l''aide au profil bas avec gonflage facilite la déflation rapide</li>
	<li><b>3 soupapes de décharge /de surpression:</b><br>One incorporé dans le haut du gonfleur Ergo - une épaule droite - troisième situé à l''arrière inférieur droit de la vessie<br>Activation facile Tirez sur les cordons et la valve de gonflage Ergo activée par câble</li>
	<li><b>Gonfleur Mares Ergo:</b><br>Utilisé dans les programmes de formation homologués - Utilisation intuitive et prise en main sécurisée - Livré avec un tuyau de 3/8 "à fermeture rapide LP</li>
	<li><b>Système de diapositives et de verrous Mares (SLS):</b><br>Système de libération de poids ultime - Confirmation visuelle de l''insertion d''un sac de poids approprié >Capacité de poids de 9 lb et 13 lbs. (4 kg et 6 kg), taille dépendante | Fermetures à glissière robustes | Poches arrière non détachables
	<li>Poids: 8.6 lbs. (3,9 kg), taille grand</li>
	<li>Manuel du propriétaire</li></ul>'
);

INSERT INTO product_detail VALUES(
	29,
	'EN',
	'<ul class="checkmark"><li>Lightweight compact travel BCD</li>
	<li>Low profile hydrodynamic design</li>
	<li>Weight integrated</li>
	<li>Padded spine and lumbar support for comfort</li>
	<li>Bx power inflator</li></ul>',
	'<p class="text-justify">The Zeagle Covert is an ultra-light, low profile, weight integrated back inflation BC that has everything you demand in a travel BC without the weight and bulk. Traveling light doesn''t mean you should compromise. The Covert BC is for those divers counting weight by the ounce and looking for uncompromising quality. Part of the popular and well known Ranger BC Lineage, the Covert is for those looking for legendary "Ranger" toughness and durability in a compact travel BC.</p>
	<p class="text-justify">Divers who travel want to bring as much of their own gear as possible. Having a BCD that is up to 30% lighter and packs up to 50% smaller, helps achieve this. Loaded with innovation, the Covert uses an elastic mesh fabric on the bladder assembly to help streamline-the-profile while allowing for expansion of the bladder to a generous 32 lbs. (14.5 kg) of lift capacity. Using a durable 1000-denier Cordura nylon material and still coming in at 3.9 lbs. (1.77 kg), the Covert is probably the lightest and most-durable BCD on the market today. Its unique design allows it to be packed as small as a newspaper. The result is a tough and durable travel BCD.</p>
	<p class="text-justify">The Covert BCD has lightly padded shoulder torso adjustable and sternum straps the shoulder straps are equipped with TSR squeeze-style" side release buckles. The shoulders are designed with wider straps for added comfort and has a Delrin D-ring mounting platform built-in. The adjustable waist strap allows for custom fitting the BC over a variety of exposure suits and is easily adjustable with one-hand. Both the sternum and waist straps also have squeeze-style" side release buckles. The BCD is designed to fit close to torso for low drag and the inner bladder can be easily patched in the field. The Covert is weight integrated with a 16 lbs. (7.26 kg) soft or hard weight capacity. The releasable touch fastener weight pockets can be easily load and unload through the top opening and the easy to use touch fastener releases with a quick downward motion of the pull handle. The BCD has a padded spine and lumbar support, dual cylinder bands for added stability and comes equipped with Zeagle''s Bx Power Inflator Mechanism. The Bx Power Inflator makes preventative maintenance easy with its threaded lower mechanism that allows the attachment of a garden hose for fast and easy inner bladder rinsing. The Bx is also connected to a pull dump valve for rapid deflation. Trimming buoyancy in any position is made easy with the additional lower rear over-pressure relief/pull dump valve with pull cord. BCD is available in multiple sizes, comes with a low pressure quick disconnect hose with 3/8" threads.</p>',
	'<ul class="indent-disc"><li>Lightweight Compact Travel BCD</li>
	<li>Ultra-Light, Low Profile, 3.9 lbs. (1.77 kg)</li>
	<li>Weight Integrated Back Inflation BC</li>
	<li>Travel BC without Weight-and-Bulk</li>
	<li>Part of Ranger BC Lineage: "Ranger" Toughness and Durability in Compact Travel BC</li>
	<li>30% Lighter and Packs up to 50% Smaller, Loaded with Innovation</li>
	<li>Elastic Mesh Fabric Bladder Assembly, Streamline-the-Profile</li>
	<li>Expansion Bladder: 32 lbs. (14.52 kg) of Lift Capacity</li>
	<li>Outer Shell: Durable 1000-Denier Cordura Nylon</li>
	<li>Lightest and Most-Durable BCD</li>
	<li>Packs Small as Sunday Newspaper</li>
	<li>Lightly Padded Shoulder Torso Adjustable Straps</li>
	<li>Adjustable Sternum Strap with Squeeze-Style" Side Release Buckle</li>
	<li>Adjustable Waist Strap</li>
	<li>Shoulder and Waist Straps Equipped with TSR Squeeze-Style" Side Release Buckles</li>
	<li>Shoulders: Wide Strap Design for Added Comfort</li>
	<li>Custom Fitting Over Variety of Exposure Suits and Easily-Adjustable with One-Hand</li>
	<li>Delrin D-Ring Mounting Platform Built-In</li>
	<li>Fits Close to Torso for Low Drag</li>
	<li>Weight Integrated: 16 lbs. (7.26 kg) Soft or Hard Weight Capacity</li>
	<li><b> Releasable Touch Fastener Weight Pockets: </b> Easily Load-and-Unload Top-Opening <br> Easy-to-Use Touch-Fastener Releases</li>
	<li>Padded Spine and Lumbar Support</li>
	<li>Dual Cylinder Bands for Added Stability</li>
	<li><b> Zeagle Bx Power Inflator: </b> <br> Cable Activated Pull Dump Valve for Rapid Deflation <br> Low Pressure Quick-Disconnect Hose with 3/8" Threads <br> Threaded Lower Mechanism Allows Attachment of Garden Hose <br> Fast and Easy Inner Bladder Rinsing</li></ul>'
);

INSERT INTO product_detail VALUES(
	29,
	'FR',
	'<ul class="checkmark"><li>BCD léger de voyage compact</li>
	<li>Conception hydrodynamique à profil bas</li>
	<li>Poids intégré</li>
	<li>Soutien lombaire et colonne vertébrale rembourrés pour plus de confort</li>
	<li>Inflateur Bx</li></ul>',
	'<p class="text-justify">Le Zeagle Covert est un système d''inflation dorsale ultra léger, discret et intégré au poids, qui possède tout ce dont vous avez besoin dans un voyage en Colombie-Britannique sans poids ni volume. Voyager léger ne signifie pas que vous devriez faire des compromis. Le Covert BC est destiné aux plongeurs comptant le poids par once et recherchant une qualité sans compromis. Faisant partie de la populaire et célèbre Ranger BC Lineage, la Covert est destinée à ceux qui recherchent la robustesse et la durabilité légendaires des "Rangers" dans un voyage compact BC.</P>
	<p class="text-justify">Les plongeurs qui voyagent veulent apporter le plus de matériel possible. Avoir un BCD jusqu''à 30% plus léger et des packs jusqu''à 50% plus petits aide à atteindre cet objectif. Doté d''innovations, le Covert utilise un tissu en maille élastique sur l''assemblage de la vessie pour aider à affiner le profil tout en permettant l''expansion de la vessie à un poids généreux de 32 lb. (14,5 kg) de capacité de levage. En utilisant un nylon Cordura durable de 1000 deniers et toujours en 3,9 lbs. (1,77 kg), le Covert est probablement le BCD le plus léger et le plus durable du marché. Son design unique lui permet d''être emballé aussi petit qu''un journal. Le résultat est un BCD de voyage robuste et durable.</P>
	<p class="text-justify">Le BCD Covert est légèrement rembourré et doté de sangles d''épaule ajustables et de sangles sternales. Les bretelles sont équipées de "boucles latérales" de type squeeze TSR. Plate-forme de montage en D-ring Delrin intégrée. La sangle de taille ajustable permet un ajustement personnalisé du BC sur une variété de combinaisons d''exposition et est facilement ajustable avec une seule main. . Le BCD est conçu pour s''adapter au torse pour une faible traînée et la vessie interne peut être facilement réparée sur le terrain. Le Covert est intégré avec un poids de 16 livres. (7.26 kg) capacité de poids doux ou dur. Les poches de poids des attaches tactiles amovibles peuvent être facilement chargées et déchargées par l''ouverture supérieure et les attaches tactiles faciles à utiliser se déplacent rapidement vers le bas de la poignée de traction. Le BCD est doté d''un support dorsal et lombaire rembourré, de deux bandes de cylindre pour plus de stabilité et est équipé du mécanisme de gonflage Bx Power de Zeagle. Le gonfleur Bx Power facilite l''entretien préventif grâce à son mécanisme inférieur fileté qui permet de fixer un tuyau d''arrosage pour un rinçage rapide et facile de la vessie. Le Bx est également connecté à une soupape de décharge pour un dégonflage rapide. La compensation de la flottabilité dans n''importe quelle position est facilitée par la soupape de décharge /de décharge de surpression arrière arrière supplémentaire avec cordon de tirage. Le BCD est disponible en plusieurs tailles, avec un tuyau de raccordement rapide à basse pression avec un filetage de 3/8 ".</P>',
	'<ul class="indent-disc"><li>BCD léger de voyage compact</li>
	<li>Ultra léger, profil bas, 3,9 lb (1,77 kg)</li>
	<li>Inflation dorsale intégrée au poids BC</li>
	<li>Voyage en Colombie-Britannique sans poids et en vrac</li>
	<li>Partie de la lignée Ranger BC: "Ranger" Résistance et durabilité dans Compact Travel BC</li>
	<li>30% plus léger et des packs jusqu''à 50% plus petits, chargés d''innovation</li>
	<li>Assemblage de vessie en tissu élastique, rationalisez le profil</li>
	<li>Expansion Bladder: 32 lbs. (14,52 kg) de capacité de levage</li>
	<li>Enveloppe extérieure: Nylon Cordura 1000 deniers durable</li>
	<li>BCD le plus léger et le plus durable</li>
	<li>Packs petit comme journal du dimanche</li>
	<li>Courroies réglables de torse d''épaule légèrement rembourrées</li>
	<li>Sangle de poitrine réglable avec boucle de relâchement latérale "Squeeze-Style"</li>
	<li>Sangle de taille ajustable</li>
	<li>Courroies d''épaule et de taille équipées de boucles à dégagement latéral TSR Squeeze-Style</li>
	<li>Épaules: conception large pour plus de confort</li>
	<li>Ajustement personnalisé sur une variété de combinaisons d''exposition et facilement ajustable avec une seule main</li>
	<li>Plate-forme de montage Delrin D-Ring intégrée</li>
	<li>S''adapte au torse pour un glissement réduit</li>
	<li>Poids intégré: 16 lb (7.26 kg) Capacité de poids molle ou dure</li>
	<li><b>Poches de poids pour fixations tactiles amovibles:</b>Faciles à charger et à décharger par le haut - Libérations simples d''attaches tactiles</li>
	<li>Soutien de la colonne vertébrale et du soutien lombaire</li>
	<li>Bandes à double cylindre pour une stabilité accrue</li>
	<li><b>Gonfleur Zeagle Bx:</b><br>Valve de vidange à tirage activé par câble pour un dégonflement rapide - Tuyau à déconnexion rapide à basse pression avec filetage 3/8 " Tuyau d''arrosage - Rinçage rapide et facile de la vessie intérieure</li></ul>'
);

--###################################################################################

INSERT INTO product_detail VALUES(
	30,
	'EN',
	'<ul class="checkmark"><li>Nitrox ready up to 40%</li>
	<li>Corrosion resistant aluminum alloy cylinder</li>
	<li>Convertible k valve, Yoke or DIN</li>
	<li>Multi ported burst plug assembly</li>
	<li>Meets certifications (DOT) with DOT-3AL</li></ul>',
	'<p class="text-justify">The Staple cylinder in the diving industry is the 80 Cubic Foot Aluminum Tank. This cylinder is used by more divers dive operators and retail dive stores than any other type of cylinder available. The Pro Valve is one of the highest flow cylinder valves available today and is also a convertible valve. Whether you dive Yoke or DIN regulators this valve will work for both. Valve has easily removed 200 bar DIN insert to convert the valve for use with DIN regulators. Valve has a heavy duty deign with a smooth operating mechanism and multi-ported burst disc plug for added safety.</p>
	<p class="text-justify">Aluminum cylinders unlike steel cylinders don''t rust, they oxidize. The oxidization of aluminum forms a protective coat that hinders the continuation of corrosion making aluminum cylinders less likely to be condemned due to excessive corrosion. When shipped the tanks valves will be removed and the tank will require re-inspection before being filled. Note: All Catalina cylinders are nitrox ready and meet certificated specifications of the US Department of Transportation (DOT) with DOT-3AL specification and Transport Canada Safety and Security (TC) with TC-3ALM specifications.</p>',
	'<ul class="indent-disc"><li>Nitrox Ready Up to 40%</li>
	<li><b> Cylinder: </b> Catalina 80 Cubic Foot</li>
	<li>Industry Standard Cylinder</li>
	<li>Thread Size: 0.750-14 NPSM</li>
	<li>Aluminum Alloy Design</li>
	<li>Won''t Rust Like Steel Cylinders</li>
	<li>Working Pressure: 3000 psi (200 bar)</li>
	<li><b> Note: </b> <br> All Catalina Cylinders Meet Certificated Specifications of the US Department of Transportation (DOT) with DOT-3AL <br> Meet Specification of the  Transport Canada Safety and Security (TC) with TC-3ALM</li>
	<li><b> Valve: </b> Pro Valve</li>
	<li>Convertible K-Valve</li>
	<li>Yoke or DIN</li>
	<li>Heavy Duty Design</li>
	<li>Smooth Operating Valve Mechanism</li>
	<li>Chrome Plated Marine Brass</li>
	<li>Multi-Ported Burst Plug Assembly</li>
	<li>High Flow Capacity Valve</li></ul>'
);

INSERT INTO product_detail VALUES(
	30,
	'FR',
	'<ul class="checkmark"><li>Nitrox prêt à 40%</li>
	<li>Cylindre en alliage d''aluminium résistant à la corrosion</li>
	<li>Valve k convertible, joug ou DIN</li>
	<li>Ensemble de prise de rafale multi-portée</li>
	<li>Satisfait aux certifications (DOT) avec DOT-3AL</li></ul>',
	'<p class="text-justify">Le cylindre en aluminium dans l''industrie de la plongée est le cylindre en aluminium de 80 pieds cubes. Ce cylindre est utilisé par plus d''opérateurs de plongée et de magasins de plongée que tout autre type de bouteille disponible. La soupape Pro est l''une des soupapes à cylindre à débit le plus élevé disponibles aujourd''hui et est également une soupape convertible. Que vous plongiez des régulateurs Yoke ou DIN, cette vanne fonctionnera pour les deux. La vanne a facilement enlevé un insert DIN de 200 bars pour convertir la vanne en vue d''une utilisation avec des régulateurs DIN. La vanne est conçue avec un mécanisme de fonctionnement souple et une prise de disque en rafale multi-port pour une sécurité accrue.</P>
	<p class="text-justify">Contrairement aux cylindres en acier, les cylindres en aluminium ne rouillent pas, ils s''oxydent. L''oxydation de l''aluminium forme une couche protectrice qui empêche la corrosion de continuer à rendre les cylindres en aluminium moins susceptibles d''être condamnés en raison d''une corrosion excessive. Une fois expédiées, les vannes des réservoirs seront retirées et le réservoir nécessitera une nouvelle inspection avant d''être rempli. Remarque: Tous les cylindres Catalina sont prêts pour le nitrox et répondent aux spécifications du Département des transports des États-Unis (DOT) avec les spécifications DOT-3AL et à la sûreté et à la sécurité de Transports Canada (TC-3ALM).</P>',
	'<ul class="indent-disc"><li>Prêt pour Nitrox Jusqu''à 40%</li>
	<li><b>Cylindre:</b>Catalina 80 Cubic Foot</li>
	<li>Cylindre standard de l''industrie</li>
	<li>Taille du filetage: 0,750-14 NPSM</li>
	<li>Design en alliage d''aluminium</li>
	<li>La rouille ne ressemble pas aux cylindres en acier</li>
	<li>Pression de service: 3000 psi (200 bars)</li>
	<li><b>Remarque:</b><br>Tous les cylindres Catalina répondent aux spécifications certifiées du Département des transports des États-Unis (DOT) avec la spécification DOT-3AL de Meet and Safety de Transports Canada avec TC-3ALM</li>
	<li><b>Valve:</b>Pro Valve</li>
	<li>Valve K convertible</li>
	<li>joug ou DIN</li>
	<li>Conception robuste</li>
	<li>Mécanisme à soupape de commande lisse</li>
	<li>Laiton Marine Plaqué Chrome</li>
	<li>Assemblage de prise rafale multi-portés</li>
	<li>Valve à haut débit</li></ul>'
);

INSERT INTO product_detail VALUES(
	31,
	'EN',
	'<ul class="checkmark"><li>Nitrox ready up to 40%</li>
	<li>Round bottom cylinder</li>
	<li>Physical vapor deposition (PVD) finish</li>
	<li>Teflon coated valve seat</li>
	<li>O-ring sealed bonnet</li></ul>',
	'<p class="text-justify">If you are not using steel cylinders, try to use one and you will soon realize what you have been missing. Faber can offer you the most comprehensive range of cylinders for scuba diving. No other manufacturer in the world can match their capabilities and the breadth of their range. Faber Tanks and XS valves are nitrox ready.</p>
	<p class="text-justify">Cylinders come equipped with a Pro valve that easily converts back and forth depending on the type of first stage regulator to be used in conjunction with the cylinder increasing the versatility of the tank. The construction allows the diver to remove lead weight from their weight belt or integrated weight system of the BCD, allowing the diver to better distribute weight by moving it to the rear of the BCD a great advantage when wearing a back inflation style (Wing) BCD.</p>',
	'<ul class="indent-disc"><li>Nitrox Ready Up to 40%</li>
	<li>Most Widely Sold Cylinder Type</li>
	<li><b> Great Buoyancy Characteristics: </b> <br> Buoyancy Full: From -2.42 lbs. to -9.41 lbs. (-1.1 kg to 4.3 kg), Size Dependent <br> Buoyancy Empty: From -1.2 lbs. to 2.35 lbs. (-0.54 kg to 1.1 kg) <br> Buoyancy Better for Back Inflation Style BCD''s (Wings) <br> Shed the Lead</li>
	<li>Weight: From 28.3 lbs. to 42.4 lbs. (13 kg to 19.4 kg)</li>
	<li>Diameter: From: 7.25" to 8.0" (10 cm to 20.3 cm)</li>
	<li>Height: From: 20.8" to 26.85" (53 cm to 68 cm)</li>
	<li><b> Construction: </b> <br> Deep Drawn Chromium Molybdenum Steel <br> Triple Protected Zinc Sprayed <br> Epoxy and Polyurethane Painted <br> Round Bottom Cylinder</li>
	<li><b> Note: </b> <br> All Faber Cylinders Meet Certificated Specifications of US Department of Transportation (DOT) with Special Permit Number 13488 <br> Meet Specification of the Transport Canada (TC) with Special Permit Number SU7694-237</li>
	<li>XS Scuba PVD Pro Valve</li>
	<li>Standard Yoke Outlet with Spin-Out DIN Insert Converts to 230 bar (3,336 psi) DIN Outlet</li>
	<li>1/4" Hex Key Wrench Removable DIN Insert</li>
	<li>3/4" - 14 NPSM Standard Inlet Threads</li>
	<li>1.5 Hand Wheel Rotations from Fully-On to Fully-Off</li>
	<li>5/32" Hex Key Dip Tube Included</li>
	<li>Tough Physical Vapor Deposition (PVD) Finish</li>
	<li>Same Finish Found on High End Watches and Faucets</li>
	<li>Durable Scratch Resistant Finish gives Valve a "Tech Look"</li>
	<li>Service Pressure: 3442 psi (240 bars)</li>
	<li>New Unique Color Coded Safety Hand Wheel</li>
	<li>Red" Valve is Completely Off</li>
	<li>Green" Valve is Completely Open and Ready for Diving</li>
	<li>Chrome Plated Durable Brass Valve Stem</li>
	<li>Teflon Coated Valve Seat</li>
	<li>O-Ring Sealed Bonnet</li>
	<li>Easy Grip Rubber Hand Wheel</li></ul>'
);

INSERT INTO product_detail VALUES(
	31,
	'FR',
	'<ul class="checkmark"><li>Nitrox prêt à 40%</li>
	<li>Cylindre à fond rond</li>
	<li>Finition du dépôt physique en phase vapeur (PVD)</li>
	<li>Siège de soupape revêtu de téflon</li>
	<li>Bague d''étanchéité à joint torique</li></ul>',
	'<p class="text -justify">Si vous n''utilisez pas de cylindres en acier, essayez d''en utiliser un et vous vous rendrez vite compte de ce qui vous manquait. Faber peut vous proposer la gamme de cylindres la plus complète pour la plongée sous-marine. Aucun autre fabricant au monde ne peut égaler ses capacités et la portée de sa gamme. Les réservoirs Faber et les vannes XS sont prêts pour le nitrox.</P>
	<p class="text-justify">Les cylindres sont équipés d''une vanne Pro qui se convertit facilement en arrière en fonction du type de régulateur de premier étage à utiliser conjointement avec le cylindre, ce qui augmente la polyvalence du réservoir. La construction permet au plongeur de retirer le poids de son poids ou de son système de musculation intégré, ce qui permet au plongeur de mieux répartir le poids en le déplaçant vers l''arrière du BCD.</p>',
	'<ul class="indent-disc"><li>Prêt pour Nitrox Jusqu''à 40%</li>
	<li>Type de cylindre le plus vendu</li>
	<li><b>Caractéristiques de flottabilité:</b><br>Flottabilité complète: de -2,42 lb. à -9,41 lb (-1,1 kg à 4,3 kg), Taille dépendante de la flottabilité Vide: De -1,2 lb à 2.35 lbs. (-0,54 kg à 1,1 kg)<br>Une meilleure flottabilité pour les BCD (ailes) de style d''inflation à l''arrière |
	<li>Poids: à partir de 28,3 lb à 42,4 livres. (13 kg à 19,4 kg)</li>
	<li>Diamètre: De: 7,25 "à 8,0" (10 cm à 20,3 cm)</li>
	<li>Hauteur: De: 20,8 "à 26,85" (53 cm à 68 cm)</li>
	<li><b>Construction:</b><br>Cylindre à fond rond peint époxy et polyuréthane - Acier au molybdène embouti et au chrome triple</li>
	<li><b>Note:</b><br>Tous les cylindres Faber respectent les spécifications certifiées du Département des transports des États-Unis (DOT) avec le numéro d''autorisation spécial 13488<br>Spécification du numéro de permis spécial de Transports Canada (TC) SU7694-237</li>
	<li>Valve XS Scuba PVD Pro</li>
	<li>Sortie de culasse standard avec embout DIN à emboutir pour une sortie DIN de 230 bars (3,336 psi)</li>
	<li>Clé hexagonale 1/4 "Insert DIN amovible</li>
	<li>3/4 "- 14 threads d''entrée standard NPSM</li>
	<li>1.5 Rotations de la molette du mode entièrement activé au mode inactif</li>
	<li>Tube de trempage à clé hexagonale de 5/32 po inclus</li>
	<li>Finition solide du dépôt physique en phase vapeur (PVD)</li>
	<li>Même finition trouvée sur les montres et les robinets haut de gamme</li>
	<li>Un fini durable résistant aux rayures donne à la soupape un aspect technique</li>
	<li>Pression de service: 3442 psi (240 bars)</li>
	<li>Nouvelle molette de sécurité à code couleur unique</li>
	<li>Rouge "La vanne est complètement désactivée</li>
	<li>Vert "La vanne est complètement ouverte et prête pour la plongée</li>
	<li>Tige de valve en laiton durable plaquée chrome</li>
	<li>Siège de soupape revêtu de téflon</li>
	<li>Bonnet à joint torique</li>
	<li>Roue à main en caoutchouc Easy Grip</li></ul>'
);

INSERT INTO product_detail VALUES(
	32,
	'EN',
	'<ul class="checkmark"><li>Nitrox Ready Up to 23.5%</li>
	<li>Aluminum alloy 6061-T6 construction</li>
	<li>Durable and corrosion resistant</li>
	<li>Meet specifications of DOT with DOT-3AL</li>
	<li>Heavy duty valve with high flow capacity</li></ul>',
	'<p class="text-justify">In 1988, Luxfer introduced scuba tanks manufactured from L6X, a proprietary formula of aluminum alloy 6061-T6 developed by Luxfer metallurgists to provide superior corrosion-resistance and dependable performance in the most demanding underwater environments. The manufacturing of Luxfer scuba cylinders has been relocated to the Graham, North Carolina factory. The original tooling is being used to maintain the same specifications, buoyancy and weight distribution. Proprietary L6X 6061-T6 aluminum alloy which has an unsurpassed record for safety and dependability will continue to be used. Luxfer is the preferred choice by military, commercial and technical divers worldwide.</p>
	<p class="text-justify">A pony bottle is a smaller tank, which is carried in addition to the main tank. It possesses its own regulator with first and second stage and sometimes a separate pressure gauge. It is mounted either at ones side or in front of the body or fixed to the main tank. A pony bottle scuba tank is the only true redundant breathing mechanism you can completely rely on. Depending on the type of diving you plan on doing will determine what capacity the redundant air supply needs to be. Leisure Pro offers four different size bottles to meet every divers requirements. If used for sport diving there are three choices 6, 13 and 19 cu ft. cylinders. If deep or deep technical diving or wreck penetration or cave diving there is the 30 cu ft. cylinder available.</p>
	<p class="text-justify">With Pro Valve, the Pro Valve is one of the highest flow cylinder valves available today and is also a convertible valve. Whether you dive Yoke or DIN regulators this valve will work for both. Valve has easily removed 200 bar (3,000 psi) DIN insert to convert the valve for use with DIN regulators. Valve has a heavy duty deign with a smooth operating mechanism and multi-ported burst disc plug for added safety. Valve is made from durable and corrosion resistant chrome plated brass.</p>',
	'<ul class="indent-disc"><li>Nitrox Ready Up to 23.5%</li>
	<li>Four Sizes to Choose</li>
	<li>Most Reliable Redundant Air Source</li>
	<li>Available in Multiple Colors</li>
	<li><b> Cylinder: </b>Luxfer Pony Bottles</li>
	<li>In 1988, Luxfer Introduced Scuba Tanks Manufactured from L6X</li>
	<li>Proprietary Formula of Aluminum Alloy: 6061-T6</li>
	<li>Superior Corrosion-Resistance and Dependable Performance</li>
	<li>Preferred Choice by Military, Commercial and Technical Divers Worldwide</li>
	<li>Best for Sport Divers: 6, 13 and 19 cu. ft. Cylinders</li>
	<li>Great for Deep and Deep Technical Diving: 30 cu ft. Cylinder</li>
	<li>Thread Size: 0.750-14 NPSM</li>
	<li>Won''t Rust Like Steel Cylinders</li>
	<li>Working Pressure: 3000 psi (200 bar)</li>
	<li><b> Note:</b> <br> All Luxfer Cylinders Meet Certificated Specifications of the US Department of Transportation (DOT) with DOT-3AL<br> Meet Specification of the Transport Canada Safety and Security (TC) with TC-3ALM</li>
	<li><b> Valve:</b> Pro Valve</li>
	<li>Convertible K-Valve</li>
	<li>Yoke or DIN</li>
	<li>Heavy Duty Design</li>
	<li>Smooth Operating Valve Mechanism</li>
	<li>Chrome Plated Marine Brass</li>
	<li>Multi-Ported Burst Plug Assembly</li>
	<li>High Flow Capacity Valve</li></ul>'
);

INSERT INTO product_detail VALUES(
	32,
	'FR',
	'<ul class="checkmark"><li>Nitrox Ready Jusqu''à 23,5%</li>
	<li>Construction en alliage d''aluminium 6061-T6</li>
	<li>Durable et résistant à la corrosion</li>
	<li>Répondre aux spécifications de DOT avec DOT-3AL</li>
	<li>Valve haute capacité à haut débit</li></ul>',
	'<p class="text-justify">En 1988, Luxfer a introduit des bouteilles de plongée fabriquées à partir de L6X, une formule exclusive d''alliage d''aluminium 6061-T6 développée par les métallurgistes de Luxfer pour offrir une résistance supérieure à la corrosion et des performances fiables dans les environnements sous-marins les plus exigeants. La fabrication des bouteilles de plongée Luxfer a été transférée à l''usine Graham, en Caroline du Nord. L''outillage d''origine est utilisé pour maintenir les mêmes spécifications, la flottabilité et la répartition du poids. L''alliage d''aluminium breveté L6X 6061-T6, qui présente un niveau de sécurité et de fiabilité inégalé, continuera d''être utilisé. Luxfer est le choix préféré des plongeurs militaires, commerciaux et techniques du monde entier.</P>
	<p class="text-justify">Une bouteille de poney est un réservoir plus petit, qui est transporté en plus du réservoir principal. Il possède son propre régulateur avec un premier et un deuxième étage et parfois un manomètre séparé. Il est monté soit sur le côté, soit devant le corps ou fixé au réservoir principal. Une bouteille de plongée en forme de poney est le seul mécanisme respiratoire redondant sur lequel vous pouvez compter. Selon le type de plongée que vous envisagez de faire, vous déterminerez la capacité de l''air redondant. Leisure Pro propose quatre bouteilles de tailles différentes pour répondre à toutes les exigences des plongeurs. Si on l''utilise pour la plongée sportive, il y a trois choix de cylindres de 6, 13 et 19 pieds cubes. Si la plongée technique profonde ou profonde ou la pénétration sur épave ou la plongée en caverne, le cylindre de 30 pieds cubes est disponible.</P>
	<p class="text-justify">Avec Pro Valve, la soupape Pro Valve est l''une des soupapes de débit les plus hautes disponibles à ce jour et est également une soupape convertible. Que vous plongiez des régulateurs Yoke ou DIN, cette vanne fonctionnera pour les deux. La vanne a facilement enlevé l''insert DIN de 200 bars (3 000 psi) pour convertir la vanne en vue d''une utilisation avec des régulateurs DIN. La vanne a un design robuste avec un mécanisme de fonctionnement souple et un connecteur de disque de rupture multi-port pour une sécurité accrue. La vanne est fabriquée en laiton chromé durable et résistant à la corrosion.</P>',
	'<ul class="indent-disc"><li>Nitrox Ready Jusqu''à 23,5%</li>
	<li>Quatre tailles à choisir</li>
	<li>Source d''air redondante la plus fiable</li>
	<li>Disponible en plusieurs couleurs</li>
	<li><b>Cylindre:</b>Bouteilles de poney Luxfer</li>
	<li>En 1988, Luxfer a présenté des réservoirs de plongée fabriqués à partir de L6X</li>
	<li>Formule exclusive d''alliage d''aluminium: 6061-T6</li>
	<li>Résistance supérieure à la corrosion et performances fiables</li>
	<li>Choix préféré des plongeurs militaires, commerciaux et techniques du monde entier</li>
	<li>Best for Sport Divers: 6, 13 et 19 cu. ft. Cylindres</li>
	<li>Idéal pour la plongée technique profonde et profonde: cylindre de 30 pi³</li>
	<li>Taille du filetage: 0,750-14 NPSM</li>
	<li>La rouille ne ressemble pas aux cylindres en acier</li>
	<li>Pression de service: 3000 psi (200 bars)</li>
	<li><b>Note:</b><br>Tous les cylindres Luxfer répondent aux spécifications certifiées du Département des transports des États-Unis (DOT) avec DOT-3AL - Spécification de la sécurité et de la sûreté de Transports Canada avec TC TC-3ALM</li>
	<li><b>Valve:</b>Pro Valve</li>
	<li>Valve K convertible</li>
	<li>joug ou DIN</li>
	<li>Conception robuste</li>
	<li>Mécanisme à soupape de commande lisse</li>
	<li>Laiton Marine Plaqué Chrome</li>
	<li>Assemblage de prise rafale multi-portés</li>
	<li>Valve à haut débit</li></ul>'
);

INSERT INTO product_detail VALUES(
	33,
	'EN',
	'<ul class="checkmark"><li>Allows quick and easy refills from scuba tank</li>
	<li>Redundant alternate air source for safety</li>
	<li>Helps assist rescue and self rescue</li>
	<li>Refillable back up system</li>
	<li>Small and easy to use</li></ul>',
	'<p class="text-justify">Having a safety back-up air supply has many advantages over a standard alternate air source. The most obvious is that it is a separate air supply and allows self rescue in an emergency out of air situation. We are taught to stay with our buddy so that in case of an emergency they are right there ready to help us. Next time you make a dive count the times your buddy is further then arms length from you. You will be surprised that they are much further away more often then you may think. Spare-Air gives you a major advantage over an alternate air source when an emergency arises. Having something to breathe from while you are swimming to your buddy, and then, getting their attention while they have their head in a hole watching a lobster can take several breaths or more of air.</p>
	<p class="text-justify">Tested and approved, Spare Air is a totally self-contained 3000 psi (200 bars) 3.0 cu. ft. (85 liter), refillable backup air system that''s small and easy to use. It was designed to get you to the surface in the event of an emergency; yet, it is small enough to not even know you are wearing it! Spare Air is easy to use and maintain, just put it in your mouth and breathe. Kit includes easy refill adapter so you can fill directly off your own Scuba cylinder. So give yourself that extra edge of safety with Spare Air. The cylinder measures (L x Dia.) 13.4" x 2.25" (34 cm x 5.71 cm) and weighs 2.17 lbs. (985 g). Note: All Spare Air cylinders meet certificated specifications of the US Department of Transportation (DOT) with DOT-3AA specification and Transport Canada Safety and Security (TC) with TC-3AAM specifications. Spare Air comes with an owner''s manual, holster, and safety leash.</p>',
	'<ul class="indent-disc"><li>Perfect Addition to Dive System</li>
	<li>Quick & Easy Refills from Scuba Tank</li>
	<li><b> Completely Redundant Alternate Air Source: </b> <br> Safety Back-Up Air Supply <br> Many Advantages Over Standard Alternate Air Source <br> Allows Self Rescue in Emergency Out-of-Air-Situation</li>
	<li>3000 psi (200 bars) 3.0 cu. ft. (85 liter) of Air</li>
	<li>Refillable Backup Air System, Small and Easy to Use</li>
	<li>Designed to Get-You-to-Surface in Event of an Emergency</li>
	<li>Easy-to-Use and Maintain, Just Put-In-Mouth and Breathe</li>
	<li>Cylinder Dimensions: (L x Dia.) 13.4" x 2.25" (34cm x 5.71cm)</li>
	<li>Weight: 2.17 lbs. (985 g)</li>
	<li>Includes Refill Adapter</li>
	<li>Holster and Safety Leash</li>
	<li>Owner''s Manual</li>
	<li><b> Note: </b> Cylinders Meet Certificated Specifications of the US Department of Transportation (DOT) with DOT-3AA </li>
	<li>Meet Specification of the Transport Canada Safety and Security (TC) with TC-3AAM</li></ul>'
);

INSERT INTO product_detail VALUES(
	33,
	'FR',
	'<ul class="checkmark"><li>Permet des recharges rapides et faciles à partir de la bouteille de plongée</li>
	<li>Source d''air de remplacement redondante pour la sécurité</li>
	<li>Aide au sauvetage et à l''auto-sauvetage</li>
	<li>Système de sauvegarde rechargeable</li>
	<li>Petit et facile à utiliser</li></ul>',
	'<p class="text-justify">Avoir une alimentation en air de secours de sécurité présente de nombreux avantages par rapport à une source d''air alternative standard. La plus évidente est qu''il s''agit d''une alimentation en air séparée et qu''elle permet de se sauver en cas de situation d''urgence en dehors de l''air. On nous apprend à rester avec notre copain afin qu''en cas d''urgence, ils soient prêts à nous aider. La prochaine fois que vous faites un compte de plongée, le temps est écoulé entre votre copain et vous. Vous serez surpris de constater qu''ils sont beaucoup plus éloignés que vous le pensez. Spare-Air vous offre un avantage majeur par rapport à une autre source d''air en cas d''urgence. Avoir quelque chose à respirer pendant que vous nagez à votre copain, puis, attirant leur attention pendant qu''ils observent un homard dans un trou, peuvent prendre plusieurs respirations ou plus d''air.</P>
	<p class="text-justify">Testé et approuvé, Spare Air est un appareil totalement autonome de 3 000 psi (200 bars). (85 litres), système d''air de secours rechargeable, compact et facile à utiliser. Il a été conçu pour vous amener à la surface en cas d''urgence; pourtant, il est assez petit pour ne pas savoir que vous le portez! L''air de rechange est facile à utiliser et à entretenir, il suffit de le mettre dans votre bouche et de respirer. Le kit comprend un adaptateur de recharge facile pour vous permettre de remplir directement votre propre bouteille de plongée. Alors, offrez-vous un avantage supplémentaire en matière de sécurité avec Spare Air. Le cylindre mesure (L x Dia.) 13,4 "x 2,25" (34 cm x 5,71 cm) et pèse 2,17 lb. (985 g). Remarque: Toutes les bouteilles d''air de secours sont conformes aux spécifications du Département des transports des États-Unis (DOT) avec les spécifications DOT-3AA et à celles de Transports Canada (TC) avec les spécifications TC-3AAM. Spare Air est livré avec un manuel du propriétaire, un étui et une laisse de sécurité.</P>',
	'<ul class="indent-disc"><li>Ajout parfait au système de plongée</li>
	<li>Recharges rapides et faciles de Scuba Tank</li>
	<li><b>Source d''air de remplacement complètement redondante:</b><br>Alimentation en air de secours de sécurité - De nombreux avantages par rapport à la source d''air alternative <br> Autogestion en cas de situation d''urgence hors de l''air</li>
	<li>3000 psi (200 bars) 3,0 cu. ft. (85 litre) d''air</li>
	<li>Système d''air de secours rechargeable, petit et facile à utiliser</li>
	<li>Conçu pour vous rendre à la surface en cas d''urgence</li>
	<li>Facile à utiliser et à maintenir, juste à mettre dans la bouche et à respirer</li>
	<li>Dimensions du cylindre: (L x Dia.) 13,4 "x 2,25" (34 cm x 5,71 cm)</li>
	<li>Poids: 2,17 lb (985 g)</li>
	<li>Inclut l''adaptateur de recharge</li>
	<li>Holster et laisse de sécurité</li>
	<li>Mode d''emploi</li>
	<li><b>Remarque:</b>Les cylindres répondent aux spécifications certifiées du Département des transports des États-Unis (DOT) avec DOT-3AA</li>
	<li>Répondre aux spécifications de Transports Canada en matière de sécurité et de sûreté avec TC-3AAM</li></ul>'
);

--###################################################################################

INSERT INTO product_detail VALUES(
	34,
	'EN',
	'<ul class="checkmark"><li>3/2mm neoprene wetsuit</li>
	<li>Durable and comfortable seam construction</li>
	<li>Smooth sliding heavy duty back zipper</li>
	<li>Durable thermoplastic rubber knee pads</li>
	<li>Ergonomic design and fit</li></ul>',
	'<p class="text-justify">These Scubapro neoprene suits will soon be your steady companion for all your diving and snorkeling activities. Elegantly cut and styled, built-in durable and fast drying nylon-2 neoprene overall, profile suits provide maximum comfort at all levels. The Scubapro Profile Steamer has a back zipper for good water sealing and great ergonomic look and fit. The heavy-duty metal zipper slider is sturdy yet easy to operate with a nylon webbing thumb loop at base of back zipper and pull-tab leash for easy donning and doffing.</p>
	<p class="text-justify">The Scubapro Profile Steamer is a 3mm suit with double blind stitched outer seams and single blind stitched inner seams for durability and comfort. The main body of the suit is in 3mm for warmth and the strategic 2mm panels provide better fit and mobility. Suit is equipped with Tatex knee pads a thermoplastic rubber (TPR) applied without using glue or stitching; provide abrasion resistance and maximum freedom of movement. Smooth cut collar neck line provides unprecedented comfort compared to traditional roll edged collars. Suit is available in multiple size sand is black and Yellow in color.</p>',
	'<ul class="indent-disc"><li>Discontinued 2015 Model</li>
	<li>Elegantly Cut-and-Styled</li>
	<li>Built-In Durable and Fast-Drying</li>
	<li>Nylon 2 Neoprene Overall</li>
	<li>Maximum Comfort at All Levels</li>
	<li>Back Zipper for Good-Water Sealing</li>
	<li>Great Ergonomic Look-and-Fit</li>
	<li>Heavy-Duty Metal Zipper Slider</li>
	<li>Nylon Webbing Thumb Loop at Base of Back-Zipper and Leash for Easy Donning</li>
	<li>Main Body 3mm for Warmth</li>
	<li>Strategic 2mm Panels Provide Better-Fit-and-Mobility</li>
	<li>Double Blind-Stitched Outer-Seams</li>
	<li>Single Blind-Stitched Inner Seams</li>
	<li>Seam Construction: Durability and Comfort</li>
	<li>Tatex Knee Pads: Thermo Plastic Rubber (TPR)</li>
	<li>Knee Pads: Abrasion Resistance and Maximum Freedom of Movement</li>
	<li>Smooth-Cut Collar Neck Line Provides Unprecedented Comfort</li>
	<li>Available in Multiple-Sizes</li>
	<li>Color: Black and Yellow</li></ul>'
);

INSERT INTO product_detail VALUES(
	34,
	'FR',
	'<ul class="checkmark"><li>Combinaison néoprène 3 /2mm</li>
	<li>Construction de coutures durable et confortable</li>
	<li>Glissière arrière robuste et coulissante</li>
	<li>Genouillères en caoutchouc thermoplastique durable</li>
	<li>Design ergonomique et ajustement</li></ul>',
	'<p class="text-justify">Ces combinaisons néoprènes Scubapro seront bientôt votre compagnon stable pour toutes vos activités de plongée et de plongée en apnée. Coupe élégante et stylée, néoprène en nylon-2 intégré durable et à séchage rapide, les combinaisons de profil offrent un confort maximal à tous les niveaux. Le Scubapro Profile Steamer est doté d''une fermeture à glissière à l''arrière pour une bonne étanchéité à l''eau et une excellente ergonomie. Le curseur à glissière robuste en métal est robuste mais facile à utiliser avec une boucle de pouce en sangle en nylon à la base de la fermeture à glissière arrière et une laisse à languette pour un enfilage et un retrait faciles.</P>
	<p class="text-justify">Le Scubapro Profile Steamer est une combinaison de 3 mm avec des coutures extérieures cousues en double aveugle et des coutures intérieures en simple cousu pour plus de durabilité et de confort. Le corps principal de la combinaison est de 3 mm pour la chaleur et les panneaux stratégiques de 2 mm offrent un meilleur ajustement et une meilleure mobilité. La combinaison est équipée de genouillères Tatex en caoutchouc thermoplastique (TPR) appliquées sans colle ni couture; offrent une résistance à l''abrasion et une liberté de mouvement maximale. La ligne de col lisse du col offre un confort sans précédent par rapport aux colliers traditionnels à bords roulés. Le costume est disponible en plusieurs tailles. Le sable est noir et jaune.</P>',
	'<ul class="indent-disc"><li>Modèle arrêté en 2015</li>
	<li>Élégamment coupé et stylisé</li>
	<li>Durable et séchage rapide intégrés</li>
	<li>Nylon 2 Neoprene Overall</li>
	<li>Un maximum de confort à tous les niveaux</li>
	<li>Fermeture à glissière arrière pour une bonne étanchéité</li>
	<li>Excellente apparence ergonomique</li>
	<li>Curseur à glissière robuste en métal</li>
	<li>Boucle de pouce en sangle en nylon à la base de la fermeture à glissière et de la laisse pour un dégagement facile</li>
	<li>Corps principal 3 mm pour la chaleur</li>
	<li>Des panneaux stratégiques de 2 mm améliorent l''adaptation et la mobilité</li>
	<li>Coutures extérieures à double couture aveugle</li>
	<li>Coutures intérieures simples avec points invisibles</li>
	<li>Construction de couture: durabilité et confort</li>
	<li>Genouillères Tatex: caoutchouc thermoplastique (TPR)</li>
	<li>Genouillères: Résistance à l''abrasion et liberté de mouvement maximale</li>
	<li>La ligne à col lisse permet un confort sans précédent</li>
	<li>Disponible en plusieurs tailles</li>
	<li>Couleur: noir et jaune</li></ul>'
);

INSERT INTO product_detail VALUES(
	35,
	'EN',
	'<ul class="checkmark"><li>8mm body/7mm hood</li>
	<li>250% more stretch neoprene</li>
	<li>Aqua Silk interior for comfort</li>
	<li>Aqualock flow vent hood purge valve</li>
	<li>Shoulder to shoulder front zipper entry</li></ul>',
	'<p class="text-justify">Significant improvements in comfort and flexibility will be one of the most noticeable enhancements found in the new Thermoprene Pro line. Now boasting a full 250% stretch; a significant improvement over the 180% stretch of the original Thermoprene material. The new materials melts" in your hands and contours every curve of your body. Thermoprene Pro wetsuits feature new patterns which have been developed using fitting data from Henderson''s pattern library which contains over five decades of USA grading and patterning knowledge.</p>
	<p class="text-justify">As the name implies, Thermoprene Pro wetsuits are a professional level wetsuits that are designed to provide maximum warmth and comfort. These suits keep you warmer longer, as the number of seams in each suit have been minimized and each seam is double glued and blind stitched. Attention-grabbing new colors, contemporary graphics and classic styling will be certain to make you look great in and out of the water. Finishing touches like soft and comfortable aqua silk lining, ergonomic Duratex knee pads and the proven self-sealing zipper closures all combine to complete the new Thermoprene Pro lineup.</p>
	<p class="text-justify">The Henderson Thermoprene Pro Hooded Semi-Dry Jumpsuit has a full shoulder to shoulder front zip entry. The zipper is a PK S-Lock design which is dependable, durable and provides proven performance. This nylon-2 neoprene suit has durable Thermoprene Pro non-pill nylon exterior laminate, 8mm body/7mm hood, and Aqua Silk interior for soft and luxurious comfort. The double glued and double sewn seams eliminate cold water entry. Aqualock flow vent purge valve in hood eliminates ballooning due to regulator exhaust or trapped air from entries. Suit is equipped with double locking, self-sealing wrist and ankle seals, which not only keep out water and reduce water exchange, but make donning and doffing easier. Enlarged Duratex kneepads for the toughest conditions and added protection. Suit is all black and available in multiple sizes.</p>',
	'<ul class="indent-disc"><li>High Quality Nylon 2 Neoprene</li>
	<li>250% Stretch Neoprene Significant Improvement Over 180% Stretch of Original</li>
	<li>More-Stretch than Standard Wetsuit Material</li>
	<li>Seams: Double Glued and Sewn Inside & Out</li>
	<li>Number of Seams  Minimized for Greater Warmth and Comfort</li>
	<li>Contoured Fit: Helps Keep Water Exchange to Minimum</li>
	<li>Strong & Flexible Duratex Knee Pads</li>
	<li>Non-Pill Nylon Exterior Laminate</li>
	<li>Aqua Silk Interior for Soft and Luxurious Comfort</li>
	<li>8mm Body/7mm Hood</li>
	<li>Aqualock Flow Vent Purge Valve in Hood Eliminates Ballooning</li>
	<li>PK S-Lock Shoulder-to-Shoulder Front Zipper Entry</li>
	<li>Zipper: Dependable, Durable and Provides Proven Performance</li>
	<li>Double Locking, Self-Sealing Wrist and Ankle Seals</li>
	<li>Enlarged Duratex Kneepads for Toughest Conditions</li>
	<li>Available in Multiple Sizes</li>
	<li>Color: Black</li></ul>'
);

INSERT INTO product_detail VALUES(
	35,
	'FR',
	'<ul class="checkmark"><li>Corps de 8 mm /capot de 7 mm</li>
	<li>250% de néoprène extensible</li>
	<li>Intérieur Aqua Silk pour plus de confort</li>
	<li>Vanne de purge de la hotte de ventilation Aqualock</li>
	<li>Épaule à l''épaule entrée de la fermeture éclair</li></ul>',
	'<p class="text-justify">Des améliorations significatives du confort et de la flexibilité seront l''une des améliorations les plus notables de la nouvelle gamme Thermoprene Pro. Maintenant une étendue complète de 250%; une amélioration significative par rapport à l''étirement de 180% de la matière Thermoprène d''origine. Les nouveaux matériaux fond "dans vos mains et dessinent toutes les courbes de votre corps. Les combinaisons de Thermoprene Pro présentent de nouveaux modèles qui ont été développés à partir des données de la bibliothèque de modèles de Henderson.
	<p class="text-justify">Comme leur nom l''indique, les combinaisons isothermiques Thermoprene Pro sont des combinaisons de niveau professionnel conçues pour offrir un maximum de chaleur et de confort. Ces combinaisons vous gardent au chaud plus longtemps, car le nombre de coutures dans chaque combinaison a été réduit au minimum et chaque couture est à double collage et cousue à l''aveugle. De nouvelles couleurs qui attirent l''attention, des graphismes contemporains et un style classique vous donneront l''assentiment de l''eau. Des finitions comme une doublure en soie douce et confortable, des genouillères Duratex ergonomiques et des fermetures à glissière auto-obturantes éprouvées se combinent pour compléter la nouvelle gamme Thermoprene Pro.</P>
	<p class="text-justify">La combinaison semi-sèche à capuchon Henderson Thermoprene Pro a une fermeture à glissière pleine longueur à l''épaule. La fermeture à glissière est une conception PK S-Lock qui est fiable, durable et offre des performances éprouvées. Cette combinaison de néoprène en nylon-2 est dotée d''un stratifié extérieur en nylon sans pilule Thermoprene Pro durable, d''un capot de 7 mm et d''un intérieur Aqua Silk pour un confort doux et luxueux. Les doubles coutures et les coutures doubles permettent d''éliminer les entrées d''eau froide. La soupape de purge de ventilation Aqualock dans la hotte élimine le gonflement dû à l''échappement du régulateur ou à l''air emprisonné dans les entrées. La combinaison est munie de joints d''étanchéité auto-étanches à poignet et à la cheville à double verrouillage, qui non seulement empêchent l''eau de pénétrer et réduisent les échanges d''eau, mais facilitent également la mise en place et le retrait. Genouillères Duratex agrandies pour les conditions les plus difficiles et une protection accrue. Le costume est tout noir et disponible en plusieurs tailles.</P>',
	'<ul class="indent-disc"><li>Néoprène Nylon 2 haute qualité</li>
	<li>Amélioration significative du néoprène extensible à 250% sur un étirement de 180% de l''original</li>
	<li>Matériau de combinaison plus extensible que standard</li>
	<li>Coutures: Double collage et cousu à l''intérieur et à l''extérieur</li>
	<li>Nombre de coutures minimisées pour plus de chaleur et de confort</li>
	<li>Coupe ajustée: permet de maintenir l''échange d''eau au minimum</li>
	<li>Genouillères Duratex robustes et flexibles</li>
	<li>Stratifié extérieur en nylon sans pilule</li>
	<li>Aqua Silk Interior pour un confort doux et luxueux</li>
	<li>Corps de 8mm /Capot de 7mm</li>
	<li>La soupape de purge Aqualock Flow Vent dans la hotte élimine le gonflement</li>
	<li>Entrée à glissière frontale épaule sur épaule PK S-Lock</li>
	<li>Fermeture à glissière: fiable, durable et offrant des performances éprouvées</li>
	<li>Joints de poignet et de cheville auto-obturants à double verrouillage</li>
	<li>Genouillères Duratex agrandies pour les conditions les plus difficiles</li>
	<li>Disponible en plusieurs tailles</li>
	<li>Couleur: noir</li></ul>'
);

INSERT INTO product_detail VALUES(
	36,
	'EN',
	'<ul class="checkmark"><li>Progressive stretch neoprene</li>
	<li>Lumbare X-Tender panels on lower back</li>
	<li>Skin to skin internal sealing flap</li>
	<li>Neoprene internal pullover bib</li>
	<li>10mm spine and kidney pad</li></ul>',
	'<p class="text-justify">Don''t want to invest in a dry-suit but want to keep warmer on your dives this Velocity Semi-Dry Hooded Suit can be right for you. Suit drastically reduces the water exchange that occurs with a standard wet suit and keeps you warmer for longer periods of time. This means increased comfort, decreased air consumption and longer bottom times. Just look at this suits features! The Velocity Ultra is a performance driven wetsuit that features the Progressive Full-Stretch (PFS) construction of the popular Velocity, with the advancement of UltraWarmth Celliant¦ Infrared Technology. Bare''s greatest innovations in design and development together for longer, more comfortable dives.</p>
	<p class="text-justify">Proprietary combination of three different full-stretch material types PFS, makes this one of the highest performing mid-priced suits available. We start with Bare-Fit, the foundation of every Bare suit, which uses ergonomic design and intricate shaping patterns with articulated arms and legs. Then we highlight areas of the suit where flexibility and abrasion resistance are essential and incorporate special full-stretch fabrics to maximize performance in these key areas. PFS gives the Velocity Ultra Series a fit and feel unlike any other. What makes the Velocity Ultra Series truly special, is that it''s the only mid-priced dive suit to feature the thermal-activated performance of Celliant¦ Infrared Technology. Using minerals woven into the fabric of the suit, Celliant¦ turns wasted body heat into infrared energy, reflecting it back to your body. This results in increased warmth, faster recovery times, and greater stamina for longer, more comfortable dives.</p>',
	'<ul class="indent-disc"><li>Progressive Full-Stretch Technology</li>
	<li>Full-Stretch Nylon-2 Neoprene</li>
	<li>Varying-Degrees of Full-Stretch Panels into Specific Performance Zones</li>
	<li>Suit Improving Fit, Feel, Comfort and Overall Performance</li>
	<li>Progressive Stretch: Concept Only Available in Velocity Series</li>
	<li>Bare-Fit: Ergonomic Suit Design, Complex Shaped Patterns with Articulated Arms and Legs</li>
	<li><b>Celliant Fabric Liner:</b><br>Highest Degree of Warmth<br>Enhanced with 13 Thermo-Reactive Minerals Woven into Fabric<br>React to Body Heat Converting it to Infrared Energy<br>Reflects it Back to Body, Increasing Circulation and Body Warmth</li>
	<li>Attached Hood Features Celliant Lining for Additional Warmth</li>
	<li>2mm Neoprene Internal Pullover Bib for Additional Warmth and Comfort</li>
	<li>Front-Entry Cross-Chest Heavy-Duty Plastic Dry Zipper</li>
	<li>10mm Spine and Kidney Pad to Provide Extra Comfort for Tank Placement</li>
	<li>Seamless Underarms for Superior Comfort when Worn On-Its-Own</li>
	<li>Additional Wet Layer or w/BCD</li>
	<li>Skin-to-Skin Double 3mm Glideskin Wrist and Ankle Seals</li>
	<li>Embossed Back Knee Flex Panels, Reduce Bulk Behind Knees when Kicking & Crouching</li>
	<li>PROTEKT Knee Protection Provides Next Generation of Abrasion/Wear Resistance</li>
	<li>Anatomically Correct Pattern for 3-Dimensional Fit</li>
	<li>Superior Fit, Comfort and Mobility</li>
	<li>Heavy-Duty Ankle Zippers for Easy Donning and Doffing</li>
	<li>Double Glued w/SECURE-LOCK Construction Eliminates Water Entry Thru-Seams</li>
	<li>Color: Black</li></ul>'
);

INSERT INTO product_detail VALUES(
	36,
	'FR',
	'<ul class="checkmark"><li>Néoprène extensible progressif</li>
	<li>Panneaux Lumbare X-Tender dans le bas du dos</li>
	<li>Volet d''étanchéité interne peau à peau</li>
	<li>Bavoir interne en néoprène</li>
	<li>épine dorsale et coussinet de 10 mm</li></ul>',
	'<p class="text-justify">Ne voulez pas investir dans une combinaison étanche, mais souhaitez garder la température sur vos plongées cette combinaison semi-sèche à capuche Velocity peut vous convenir. Suit réduit considérablement les échanges d''eau avec une combinaison standard et vous permet de rester au chaud pendant de longues périodes. Cela signifie un confort accru, une consommation d''air réduite et des temps de fond plus longs. Il suffit de regarder cela convient à des fonctionnalités! La Velocity Ultra est une combinaison de plongée axée sur la performance qui intègre la construction PFS (Progressive Full-Stretch) de la populaire Velocity, avec les progrès de la technologie infrarouge UltraWarmth Celliant®. Les plus grandes innovations de Bare dans la conception et le développement pour des plongées plus longues et plus confortables.</P>
	<p class="text-justify">Combinaison exclusive de trois types de matériaux PBS extensibles, ce qui en fait l''un des modèles les plus performants disponibles à prix moyen. Nous commençons avec Bare-Fit, la base de chaque costume Bare, qui utilise un design ergonomique et des motifs complexes avec des bras et des jambes articulés. Ensuite, nous mettons en évidence les zones de la combinaison où la flexibilité et la résistance à l''abrasion sont essentielles et incorporent des tissus extensibles spéciaux pour maximiser les performances dans ces domaines clés. La PFS confère à la série Velocity Ultra un ajustement et une sensation incomparables. Ce qui rend la série Velocity Ultra vraiment spéciale, c''est qu''elle est la seule combinaison de plongée à prix moyen à présenter la performance à activation thermique de la technologie infrarouge Celliant®. En utilisant des minéraux tissés dans le tissu de la combinaison, Celliant¦ transforme la chaleur corporelle perdue en énergie infrarouge, la renvoyant dans votre corps. Cela se traduit par une chaleur accrue, des temps de récupération plus rapides et une plus grande endurance pour des plongées plus longues et plus confortables.</P>',
	'<ul class="indent-disc"><li>Technologie progressive complète</li>
	<li>Néoprène Nylon-2 entièrement extensible</li>
	<li>Différences de degrés de panneaux extensibles dans des zones de performances spécifiques</li>
	<li>Combinaison améliorant l''ajustement, la sensation, le confort et la performance globale</li>
	<li>Stretch progressif: Concept uniquement disponible dans la série Velocity</li>
	<li>Bare-Fit: conception ergonomique du costume, motifs complexes avec bras et jambes articulés</li>
	<li><b>Doublure pour tissus Celliant:</b><br>Plus haut degré de chaleur - Amélioré avec 13 minéraux thermo-réactifs tissés pour réagir à la chaleur du corps it back to body, circulation croissante et chaleur corporelle</li>
	<li>Capot attaché avec doublure Celliant pour plus de chaleur</li>
	<li>Bavoir interne en néoprène de 2 mm pour plus de chaleur et de confort</li>
	<li>Fermeture à glissière en plastique résistante à usage intensif sur la poitrine à entrée frontale</li>
	<li>épine dorsale et coussinet de 10 mm pour plus de confort lors du placement dans le réservoir</li>
	<li>Des aisselles sans coutures pour un confort supérieur lorsque porté sur soi-même</li>
	<li>Couche humide supplémentaire ou w /BCD</li>
	<li>Joints pour poignet et cheville en peau de peau double 3mm Glideskin</li>
	<li>Panneaux de genoux flexibles en relief, réduisent la masse derrière les genoux lors de coups de pied et de accroupissements</li>
	<li>La protection des genoux PROTEKT offre une nouvelle génération de résistance à l''abrasion /à l''usure</li>
	<li>Modèle anatomiquement correct pour un ajustement tridimensionnel</li>
	<li>Ajustement, confort et mobilité supérieurs</li>
	<li>Fermetures à glissière très résistantes pour un soulagement et un retrait faciles</li>
	<li>Double collage w /SECURE-LOCK Construction élimine les traversées d''eau</li>
	<li>Couleur: noir</li></ul>'
);

INSERT INTO product_detail VALUES(
	37,
	'EN',
	'<ul class="checkmark"><li>Full suit design</li>
	<li>Non chafing flat lock overlapping seams</li>
	<li>Fully adjustable neck seal</li>
	<li>Paddle zones for unrestricted motion</li>
	<li>3/2mm Fluid Flex neoprene construction</li></ul>',
	'<p class="text-justify">The newly upgraded Reactor II is engineered for performance in a value driven package. A perfect combination of stretch and durability. Fresh colors and graphics with style that''s built to last. The Reactor II 3/2mm Full Suit comes equipped with a back-zipper entry system that provides easy entry and exit with a water-resistant closure. Ultra-stretch, super soft and premium nylon 2 neoprene for superior feel, flexibility and high performance. Seamless paddle zones are flexible design utilizing minimal seam placement for comfort. 100% ultra-stretch super gooey for superior feel and flexibility.</p>
	<p class="text-justify">All seams are sewn with flat-lock stitch and are breathable in design. The suit comes with Kyrpto knee pads for protection of this high wear area. A double super seal neck adds comfort and reduces water exchange. When you''re sitting on your board or boat between sets or on a surface interval, the wind-resistant smooth-skin chest and back panels will keep you warmer. The rear zipper comes equipped with a pull tab leash to help in easy self-donning and doffing. Suit is available in multiple sizes.</p>',
	'<ul class="indent-disc"><li>Get a Full Dose of Performance Technology</li>
	<li>Fluid-Flex Foam Neoprene</li>
	<li>Exclusive Fluid-Flex Material in Shoulders and Sleeves</li>
	<li><b>Seams:</b><br>Flat-Lock Stitched<br>Breathable<br>Overlapping Seam<br>Non-Chafing & Super Durable for Warmer Conditions</li>
	<li>Nylon 1 and 2 Neoprene Rubber</li>
	<li>Fully Adjustable Super Seal Neck</li>
	<li>Paddle Zones: Unrestricted Motion and Eliminates Rash</li>
	<li>Seamless Under-Sleeve Panel Paddle Zones</li>
	<li>Krypto Padz: Ergonomic Knee Protection</li>
	<li>Easy-Entry Back YKK-Zipper with Pull Tab Leash</li>
	<li>Available in Multiple Sizes and Colors</li></ul>'
);

INSERT INTO product_detail VALUES(
	37,
	'FR',
	'<ul class="checkmark"><li>Conception de la combinaison complète</li>
	<li>Coutures plates sans frottement</li>
	<li>Joint de cou entièrement réglable</li>
	<li>Zones de palette pour un mouvement illimité</li>
	<li>Construction néoprène Fluid Flex 3 /2mm</li></ul>',
	'<p class="text-justify">Le Reactor II, récemment mis à niveau, est conçu pour être performant dans un package axé sur la valeur. Une combinaison parfaite d''étirement et de durabilité. Des couleurs et des graphiques frais avec un style conçu pour durer. La combinaison complète Reactor II 3 /2mm est équipée d''un système d''entrée à fermeture éclair qui permet une entrée et une sortie faciles grâce à une fermeture étanche. Nylon néoprène 2 ultra-extensible, super doux et haut de gamme pour une sensation, une flexibilité et une performance supérieures. Les zones de pagaie sans couture sont de conception flexible utilisant un placement de couture minimal pour le confort. 100% ultra-stretch ultra-gluant pour une sensation et une souplesse supérieures.</P>
	<p class="text-justify">Toutes les coutures sont cousues avec des points plats et respirantes. La combinaison est équipée de genouillères Kyrpto pour la protection de cette zone d''usure élevée. Un double col super joint ajoute du confort et réduit les échanges d''eau. Lorsque vous êtes assis sur votre planche ou sur un bateau entre deux sets ou sur un intervalle de surface, la poitrine et le dos en peau lisse résistante au vent vous garderont au chaud. La fermeture à glissière arrière est équipée d''une lanière de tirette pour faciliter la mise en place et le retrait. Suit est disponible en plusieurs tailles.</P>',
	'<ul class="indent-disc"><li>Obtenez une technologie complète de performance</li>
	<li>Néoprène en mousse Fluid-Flex</li>
	<li>Matériau exclusif Fluid-Flex dans les épaules et les manches</li>
	<li><b>Coutures:</b><br>Couture à recouvrement plat et à coutures plates - Respirable - Sans frottement et très durable pour des conditions plus chaudes</li>
	<li>Caoutchouc néoprène Nylon 1 et 2</li>
	<li>Cou Super Seal entièrement ajustable</li>
	<li>Zones de palette: mouvement illimité et élimination des éruptions cutanées</li>
	<li>Zones de pagaie sans couture sous panneau</li>
	<li>Krypto Padz: Protection ergonomique du genou</li>
	<li>Fermeture à glissière YKK à ouverture facile avec languette à tirette</li>
	<li>Disponible en plusieurs tailles et couleurs</li></ul>'
);
--(8)#####################################################################################

CREATE TABLE placed_order
(
	order_number VARCHAR2(10),
	status VARCHAR2(50) DEFAULT 'Order Received',
	email VARCHAR2(50) NOT NULL,
	CONSTRAINT order_number_placed_order_pk PRIMARY KEY (order_number),
	CONSTRAINT email_placed_order_fk FOREIGN KEY (email)
		REFERENCES customer (email)
);

--(9)#####################################################################################

CREATE TABLE order_line
(
	sku INTEGER,
	order_number VARCHAR2(10),
	quantity INTEGER NOT NULL,
	prix NUMBER(6,2) NOT NULL,	
	CONSTRAINT sku_order_number_order_line_pk PRIMARY KEY (sku, order_number),	
	CONSTRAINT sku_order_line_fk FOREIGN KEY (sku)
		REFERENCES product (sku),	
	CONSTRAINT order_number_order_line_fk FOREIGN KEY (order_number)
		REFERENCES placed_order (order_number)
);

--(10)#####################################################################################

CREATE TABLE payment
(
	payment_mode VARCHAR2(50),
	order_number VARCHAR2(10) NOT NULL,
	CONSTRAINT payment_mode_payment_pk PRIMARY KEY (payment_mode),
	CONSTRAINT order_number_payment_fk FOREIGN KEY (order_number)
		REFERENCES placed_order (order_number)
);

--(11)#####################################################################################

CREATE TABLE bill
(
	bill_number VARCHAR2(10),
	order_number VARCHAR2(10) NOT NULL,
	final_order_price NUMBER(8,2) NOT NULL,
	CONSTRAINT payment_mode_bill_pk PRIMARY KEY (bill_number),
	CONSTRAINT order_number_bill_fk FOREIGN KEY (order_number)
		REFERENCES placed_order (order_number)
);