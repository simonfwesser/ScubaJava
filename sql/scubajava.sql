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