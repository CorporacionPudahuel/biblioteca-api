DROP TABLE BSP_ZONES;
DROP TYPE BSP_ZONES_TYPE_ENUM;

-- Tipo enumerado para el tipo de uso de la zona (mejor que SMALLINT con valores codificados)
CREATE TYPE BSP_ZONES_TYPE_ENUM AS ENUM (
    'direct_use',            -- 0: Sólo se usa
    'conditional_request',   -- 1: Se solicita con condiciones de uso
    'scheduled_request'      -- 2: Sólo se pide con fecha y hora
);

-- Tabla principal
CREATE TABLE BSP_ZONES (
    ZONE_ID                 SERIAL PRIMARY KEY,
    ZONE_CODE               CHAR(3) NOT NULL,
    ZONE_TITLE              VARCHAR(255) NOT NULL,
    ZONE_TYPE               BSP_ZONES_TYPE_ENUM NOT NULL DEFAULT 'direct_use',
    ZONE_VISIBILITY         BOOLEAN NOT NULL DEFAULT TRUE,  -- TRUE = visible, FALSE = oculta
    ZONE_VECTOR_SRC         VARCHAR,
    ZONE_VECTOR_BASE64      TEXT,
    ZONE_HTML_DESCRIPTION   TEXT,
    ZONE_IMAGE_SRC          VARCHAR,
    ZONE_IMAGE_BASE64       TEXT,
    ZONE_ORDER              INTEGER,  -- Evita la palabra reservada "ORDER"
    ZONE_STATUS             BOOLEAN NOT NULL DEFAULT TRUE  -- TRUE = activo, FALSE = inactivo
);

-- Comentarios descriptivos (buena práctica para documentación)
COMMENT ON TABLE BSP_ZONES IS 'Contiene la información de las zonas de la Biblioteca San Pablo';

COMMENT ON COLUMN BSP_ZONES.ZONE_TYPE IS 'Define cómo puede solicitarse el uso de la zona: 
- direct_use: acceso inmediato sin trámite,
- conditional_request: requiere aceptar condiciones,
- scheduled_request: requiere reservar con fecha y hora.';

COMMENT ON COLUMN BSP_ZONES.ZONE_VISIBILITY IS 'Indica si la zona aparece en interfaces públicas: TRUE = visible, FALSE = oculta';

COMMENT ON COLUMN BSP_ZONES.ZONE_STATUS IS 'Estado lógico del registro: TRUE = activo, FALSE = eliminado lógicamente';

GRANT SELECT, INSERT ON BSP_ZONES TO sabiblio;

DROP TABLE BSP_ZONES;
DROP TYPE BSP_ZONES_TYPE_ENUM;

-- Tipo enumerado para el tipo de uso de la zona (mejor que SMALLINT con valores codificados)
CREATE TYPE BSP_ZONES_TYPE_ENUM AS ENUM (
    'direct_use',            -- 0: Sólo se usa
    'conditional_request',   -- 1: Se solicita con condiciones de uso
    'scheduled_request'      -- 2: Sólo se pide con fecha y hora
);

-- Tabla principal
CREATE TABLE BSP_ZONES (
    ZONE_ID                 SERIAL PRIMARY KEY,
    ZONE_CODE               CHAR(3) NOT NULL,
    ZONE_TITLE              VARCHAR(255) NOT NULL,
    ZONE_TYPE               BSP_ZONES_TYPE_ENUM NOT NULL DEFAULT 'direct_use',
    ZONE_VISIBILITY         BOOLEAN NOT NULL DEFAULT TRUE,  -- TRUE = visible, FALSE = oculta
    ZONE_VECTOR_SRC         VARCHAR,
    ZONE_VECTOR_BASE64      TEXT,
    ZONE_HTML_DESCRIPTION   TEXT,
    ZONE_IMAGE_SRC          VARCHAR,
    ZONE_IMAGE_BASE64       TEXT,
    ZONE_ORDER              INTEGER,  -- Evita la palabra reservada "ORDER"
    ZONE_STATUS             BOOLEAN NOT NULL DEFAULT TRUE  -- TRUE = activo, FALSE = inactivo
);

-- Comentarios descriptivos (buena práctica para documentación)
COMMENT ON TABLE BSP_ZONES IS 'Contiene la información de las zonas de la Biblioteca San Pablo';

COMMENT ON COLUMN BSP_ZONES.ZONE_TYPE IS 'Define cómo puede solicitarse el uso de la zona: 
- direct_use: acceso inmediato sin trámite,
- conditional_request: requiere aceptar condiciones,
- scheduled_request: requiere reservar con fecha y hora.';

COMMENT ON COLUMN BSP_ZONES.ZONE_VISIBILITY IS 'Indica si la zona aparece en interfaces públicas: TRUE = visible, FALSE = oculta';

COMMENT ON COLUMN BSP_ZONES.ZONE_STATUS IS 'Estado lógico del registro: TRUE = activo, FALSE = eliminado lógicamente';

GRANT SELECT, INSERT ON BSP_ZONES TO sabiblio;


/*
 * PRIMERA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '001'
    , 'Auditorio'
    , 'conditional_request'
    , TRUE
    , './img/Vectores/VectorAuditorio.png'
    , NULL
    , '<html>
                                <p paragraph-space>Con más de 95 m² y capacidad para 100 personas, este auditorio es un espacio versátil ideal para actividades como charlas, exposiciones, presentaciones de libros, reuniones, ceremonias y más.</p>
                                <p paragraph-space>Está completamente equipado con amplificación de audio, micrófonos, parlantes, proyector, TV, y pizarras, ofreciendo todas las herramientas necesarias para eventos culturales y educativos.</p>
                                <p paragraph-space>El auditorio está disponible para instituciones, entidades, programas municipales y estatales que fomenten la formación y extensión cultural.</p>
                                <p paragraph-space><b>¿Cómo solicitar este espacio?</b></p><p paragraph-space>Para solicitar el auditorio, debes enviar un correo a <b><i>biblioteca.solicitudes@codep.cl</i></b></p></html>'
    , '/images/zones/sala-lectura.jpg'
    , NULL
    , 1
    , TRUE
);


/*
 * SEGUNDA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '002'
    , 'Zona Infantil'
    , 'direct_use'
    , TRUE
    , './img/Vectores/VectorZonaInfantil.png'
    , NULL
    , '<html><p paragraph-space>La Zona Infantil es un espacio diseñado especialmente para los más pequeños de la familia. Su objetivo es fomentar la curiosidad, el amor por los libros y el aprendizaje mediante experiencias interactivas y educativas, en un entorno cálido y acogedor. </p> <p class= "paragraph-subtitle">¿Qué encontrarás en la Zona Infantil?</p><p class="paragraph-sub"><b>Mobiliario infantil adaptado:</b> Mesas y sillas ergonómicas y de diseño divertido, ideales para el tamaño de los niños y niñas. Además, cuenta con poufs que crean un rincón cómodo y colorido, haciendo de la lectura una experiencia divertida y placentera.</p><p class="paragraph-sub"><b>Estanterías accesibles:</b> Las estanterías de baja altura permiten que los niños elijan sus libros de manera autónoma, fomentando su independencia y entusiasmo por la lectura.<p class="paragraph-sub"><b>Un ambiente estimulante:</b> El espacio está decorado con colores vivos y un diseño atractivo que invita a explorar y disfrutar de cada rincón.</p><p class="paragraph-sub"><b>Libros y materiales para cada etapa:</b></p><ul class="custom-list"><li>Libros de tela y cartón con puntas redondeadas para bebés</li><li>Libros de primeras palabras, formatos grandes con ilustraciones llamativas, pop-ups, sonoros e interactivos</li><li>Materiales para los "superlectores" más avanzados</li></ul><p class="paragraph-sub"><b>Espacios para talleres y eventos:</b> La Zona Infantil es también un punto de encuentro para actividades culturales y educativas, como cuentacuentos, visitas guiadas, talleres de manualidades y dibujo, lanzamientos de libros infantiles y mucho más.<br></p><p class="paragraph-sub"><b>Zona de lactancia y mudador:</b> El espacio incluye un baño adaptado para niños con mudador, una silla mecedora para mayor comodidad, un corral con alfombra de goma eva para bebés, y un sector destinado a la lactancia.</p><p class="paragraph-sub"><b>Equipo a cargo:</b> La Zona Infantil está a cargo de Salomé González, con el apoyo de la profesional Vania Burgos, quienes se encargan de garantizar que cada visita sea una experiencia enriquecedora y memorable.</p></html>'
    , './img/espacios/Espacio_02_ZonaInfantil_1.jpg'
    , NULL
    , 2
    , TRUE
);


/*
 * TERCERA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '003'
    , 'Zona General'
    , 'direct_use'
    , TRUE
    , './img/Vectores/VectorZonaGeneral.png'
    , NULL
    , '<p paragraph-space>La Zona General está diseñada para responder a las necesidades informativas, educativas y recreativas de los usuarios adultos. Este espacio combina tranquilidad, acceso a una variada oferta de recursos y un ambiente ideal para la lectura, el estudio y la consulta. Pensado para quienes buscan aprender, explorar o disfrutar de sus temas de interés, es un lugar que se adapta a todo tipo de necesidades y curiosidades.<p class= "paragraph-subtitle">¿Qué ofrece la Zona General?</p><ul class="custom-list"><li><b>Espacio amplio y organizado:</b> Ubicada en una zona tranquila, lejos de las áreas más dinámicas como la infantil o juvenil, esta sección brinda un entorno sereno, ideal para la concentración. Las estanterías están organizadas por temáticas y géneros, facilitando la búsqueda y el acceso a los materiales de tu interés.</li><li><b>Mobiliario cómodo y funcional:</b>Equipado con mesas y sillas ergonómicas para la lectura y el estudio, además de sillones que invitan a relajarse mientras disfrutas de un libro o revista. La disposición del mobiliario permite tanto actividades individuales como grupales, adaptándose a las preferencias de los usuarios.</li><li><b>Una amplia selección de libros:</b>En esta zona encontrarás un vasto repertorio de títulos que abordan una gran variedad de temas:<ul><li><b>Ficción:</b> Novelas contemporáneas, literatura clásica y relatos de diversos géneros.</li><li><b>No ficción:</b> Biografías, ensayos, filosofía, historia, política, arte, ciencias sociales, desarrollo personal, salud, economía, entre otros temas de interés general.</li></ul><li><b>Salas de estudio:</b> Espacios especialmente diseñados para garantizar la concentración, ideales para trabajar, estudiar o realizar tareas de manera cómoda y eficiente. Estas salas están equipadas con televisores y pizarras que puedes solicitar en el mesón de inscripciones.</li><li><b>Un espacio pensado para todos:</b> La Zona General no solo ofrece recursos, sino también un ambiente que fomenta el aprendizaje, la reflexión y el disfrute. Es el lugar perfecto para quienes buscan un espacio sereno para crecer, explorar y disfrutar de la lectura.</li></ul></html>'
    , './img/espacios/zona_general_002.png'
    , NULL
    , 3
    , TRUE
);

/*
 * CUARTA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '004'
    , 'Zona Juvenil'
    , 'direct_use'
    , TRUE
    , './img/Vectores/VectorZonaJuvenil.png'
    , NULL
    , '<html><p paragraph-space>La Zona Juvenil es un espacio dinámico diseñado especialmente para que los jóvenes puedan relajarse, inspirarse y conectar con otros que comparten sus intereses. Es el lugar perfecto para leer, crear, aprender y, sobre todo, divertirse </p><p class= "paragraph-subtitle">¿Qué te espera en la Zona Juvenil?</p><p paragraph-space>Este rincón está lleno de libros que despiertan la imaginación: aventuras, fantasía, ciencia ficción y novelas de misterio. Pero eso no es todo, también encontrarás cómics, mangas y novelas gráficas.</p>

                                    <p class= "paragraph-subtitle">
                                        Espacios modernos y acogedores:
                                    </p>

                                    <p paragraph-space>
                                        Al entrar, te encontrarás con un diseño fresco y llamativo, pensado para que te sientas cómodo y 
                                        disfrutes al máximo. Colores vibrantes, muebles ergonómicos y cómodos, además de conexiones eléctricas 
                                        en todos lados para que la batería nunca sea un problema. Y una zona de computadores con acceso a wifi. 
                                    </p>
                                    <p class= "paragraph-subtitle">
                                        Actividades que van más allá de la lectura:
                                    </p>

                                    <p paragraph-space>
                                        Aquí organizamos talleres, charlas, clubes de lectura y eventos donde podrás participar activamente. 
                                        Aprende a escribir tus propias historias, diseña un cómic, comparte tus opiniones sobre el último libro 
                                        que leíste o únete a actividades creativas. Además, en ciertos eventos tendrás la oportunidad de conocer 
                                        autores, hacer preguntas y descubrir tu próxima lectura favorita.
                                    </p>
                                    <p paragraph-space>
                                        <b>Un lugar accesible y seguro:</b> Diseñado pensando en todos, la Zona Juvenil es un espacio inclusivo y 
                                        accesible, donde puedes disfrutar con total tranquilidad. Siempre hay personal dispuesto a ayudarte y a 
                                        asegurarse de que tengas la mejor experiencia posible.
                                    </p>
                                    
                                    <p paragraph-space>
                                        <b>Ambiente inclusivo y abierto:</b> Aquí, todas y todos son bienvenidos. No importa tu estilo, tus intereses
                                        o tu historia, en la Zona Juvenil encontrarás un lugar donde sentirte respetado y en confianza. Es un espacio 
                                        para expresarte libremente, compartir tus pasiones y conectar con otros jóvenes que comparten tus mismos 
                                        intereses.
                                    </p>


                            </html>'
    , './img/espacios/ZonaJuvenil_003.png'
    , NULL
    , 4
    , TRUE
);

/*
 * QUINTA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '005'
    , 'Sala Capacitación'
    , 'conditional_request'
    , TRUE
    , './img/Vectores/VectorSalaCapacitacion.png'
    , NULL
    , '<p paragraph-space> 
                                Con 35 m² y capacidad para 40 personas, esta sala es ideal para capacitaciones, charlas, exposiciones, 
                                presentaciones de libros, reuniones, ceremonias, y mucho más.
                            </p>
                            <p paragraph-space>
                                El espacio cuenta con amplificación de audio, micrófonos, parlantes, proyector, TV, y pizarras, ofreciendo todas 
                                las herramientas necesarias para actividades relacionadas con la formación y extensión cultural.
                            <p>
                            <p paragraph-space>
                                Está disponible para instituciones, entidades, y programas municipales y estatales que trabajen en iniciativas 
                                culturales y educativas.
                            </p>
                            <p class=paragraph-subtitle>
                                ¿Cómo solicitar este espacio?
                            <p>
                            <p paragraph-space> 
                                Para más información o para gestionar la sala de capacitación, envíanos un correo a <b><i>biblioteca.solicitudes@codep.cl</i></b>.
                            </p>'
    , './img/espacios/SALA CAPACITACION_2.jpg'
    , NULL
    , 5
    , TRUE
);

/*
 * SEXTA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '006'
    , 'Zona Exposiciones'
    , 'direct_use'
    , TRUE
    , './img/Vectores/VectorZonaExposiciones.png'
    , NULL
    , '<p class=paragraph-space> 
                                La Zona de Exposiciones de la Biblioteca Municipal de Pudahuel es un espacio abierto a la comunidad, dedicado a la difusión de expresiones 
                                artísticas, culturales y patrimoniales. Su objetivo es fomentar el encuentro entre los creadores locales y el público, promoviendo la reflexión, 
                                el diálogo y el acceso a diversas manifestaciones culturales.
                            </p>
                            <p class=paragraph-space> 
                                Ubicada en el corazón de la biblioteca, esta área alberga exposiciones temporales de arte visual, fotografía, ilustración, proyectos 
                                comunitarios y muestras temáticas. A lo largo del año, se programan iniciativas colaborativas con artistas, colectivos culturales, 
                                centros educativos y organizaciones vecinales.
                            </p>
                            <p class=paragraph-space> 
                                Este espacio no solo busca exhibir, sino también invitar a la participación activa, fortaleciendo el rol de la biblioteca como un centro
                                cultural vivo, inclusivo y en constante vínculo con su comunidad.
                            </p>
                            <p class=paragraph-subtitle>
                              ¿Te gustaría exponer en nuestra biblioteca?
                            </p>
                            <p class=paragraph-space-bold>
                              Para más información, envíanos un correo a biblioteca.jperez@codep.cl .
                            </p>'
    , './img/espacios/ZONA EXPOSICIONES.jpg'
    , NULL
    , 6
    , TRUE
);

/*
 * SÉPTIMA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '007'
    , 'Cafetería'
    , 'direct_use'
    , FALSE
    , ''
    , NULL
    , 'SÉPTIMO Texto para el séptimo espacio <br><br> con salto de líneaLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porttitor, justo vel porttitor faucibus, tortor nunc commodo augue, at rhoncus urna mauris non sem. Sed nec mauris purus. Mauris fermentum at lorem et egestas. Donec iaculis dictum dolor, vel auctor nibh scelerisque sit amet. Aenean pellentesque consectetur dui, at rutrum nunc. Fusce accumsan urna eu quam pretium euismod. Integer ac ante est. Maecenas lorem sem, venenatis sit amet sollicitudin quis, tincidunt sed magna. Maecenas ultricies orci nec neque faucibus, nec viverra sapien tincidunt.<br>Fusce convallis vestibulum velit, in ornare augue suscipit eu. Integer sapien purus, dapibus id ultricies non, ullamcorper et magna. Cras ornare mi eget magna vulputate fringilla eu vel nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus vel magna ut purus laoreet fermentum quis non ante. Ut malesuada risus vitae lectus congue vulputate. Pellentesque viverra lacinia neque, vitae commodo eros condimentum et. Maecenas metus massa, posuere ac magna vel, lobortis dapibus arcu. Etiam at urna at nisl facilisis tincidunt sed non sem. Aenean malesuada felis condimentum dolor venenatis, in molestie quam posuere. Sed malesuada placerat est, sit amet euismod turpis iaculis a.<br>Nam libero eros, iaculis eu mauris vel, ullamcorper imperdiet arcu. Morbi porttitor risus urna, quis malesuada magna iaculis nec. Sed fringilla feugiat odio eget mattis. Suspendisse ac felis dui. Donec pellentesque mi vel urna venenatis, sed varius nunc molestie. Curabitur feugiat lectus nec nibh facilisis ultrices. Pellentesque porttitor suscipit vestibulum. Donec eget ante porttitor, faucibus est non, cursus diam. Nulla facilisi. Fusce in ipsum sit amet enim sollicitudin porttitor et sit amet nisl. Pellentesque convallis ornare nunc sed pretium. Praesent sed facilisis tellus. Nullam finibus eros est. Nulla imperdiet augue nulla. Proin laoreet mauris in eros laoreet consectetur. Nulla lacinia, felis vitae vestibulum pharetra, ante tortor rhoncus libero, non maximus tortor dolor et lectus.'
    , './img/espacios/imagen_espacio_07.jpg'
    , NULL
    , 7
    , FALSE
);

/*
 * OCTAVA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '008'
    , 'Explanada'
    , 'direct_use'
    , FALSE
    , ''
    , NULL
    , 'EXPLANADA Texto para el octavo espacio <br><br> con salto de líneaLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porttitor, justo vel porttitor faucibus, tortor nunc commodo augue, at rhoncus urna mauris non sem. Sed nec mauris purus. Mauris fermentum at lorem et egestas. Donec iaculis dictum dolor, vel auctor nibh scelerisque sit amet. Aenean pellentesque consectetur dui, at rutrum nunc. Fusce accumsan urna eu quam pretium euismod. Integer ac ante est. Maecenas lorem sem, venenatis sit amet sollicitudin quis, tincidunt sed magna. Maecenas ultricies orci nec neque faucibus, nec viverra sapien tincidunt.<br>Fusce convallis vestibulum velit, in ornare augue suscipit eu. Integer sapien purus, dapibus id ultricies non, ullamcorper et magna. Cras ornare mi eget magna vulputate fringilla eu vel nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus vel magna ut purus laoreet fermentum quis non ante. Ut malesuada risus vitae lectus congue vulputate. Pellentesque viverra lacinia neque, vitae commodo eros condimentum et. Maecenas metus massa, posuere ac magna vel, lobortis dapibus arcu. Etiam at urna at nisl facilisis tincidunt sed non sem. Aenean malesuada felis condimentum dolor venenatis, in molestie quam posuere. Sed malesuada placerat est, sit amet euismod turpis iaculis a.<br>Nam libero eros, iaculis eu mauris vel, ullamcorper imperdiet arcu. Morbi porttitor risus urna, quis malesuada magna iaculis nec. Sed fringilla feugiat odio eget mattis. Suspendisse ac felis dui. Donec pellentesque mi vel urna venenatis, sed varius nunc molestie. Curabitur feugiat lectus nec nibh facilisis ultrices. Pellentesque porttitor suscipit vestibulum. Donec eget ante porttitor, faucibus est non, cursus diam. Nulla facilisi. Fusce in ipsum sit amet enim sollicitudin porttitor et sit amet nisl. Pellentesque convallis ornare nunc sed pretium. Praesent sed facilisis tellus. Nullam finibus eros est. Nulla imperdiet augue nulla. Proin laoreet mauris in eros laoreet consectetur. Nulla lacinia, felis vitae vestibulum pharetra, ante tortor rhoncus libero, non maximus tortor dolor et lectus.'
    , './img/espacios/imagen_espacio_08.jpg'
    , NULL
    , 8
    , FALSE
);

/*
 * NOVENA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '009'
    , 'Biblioredes'
    , 'direct_use'
    , FALSE
    , ''
    , NULL
    , 'NOVENO Texto para el noveno espacio <br><br> con salto de líneaLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porttitor, justo vel porttitor faucibus, tortor nunc commodo augue, at rhoncus urna mauris non sem. Sed nec mauris purus. Mauris fermentum at lorem et egestas. Donec iaculis dictum dolor, vel auctor nibh scelerisque sit amet. Aenean pellentesque consectetur dui, at rutrum nunc. Fusce accumsan urna eu quam pretium euismod. Integer ac ante est. Maecenas lorem sem, venenatis sit amet sollicitudin quis, tincidunt sed magna. Maecenas ultricies orci nec neque faucibus, nec viverra sapien tincidunt.<br>Fusce convallis vestibulum velit, in ornare augue suscipit eu. Integer sapien purus, dapibus id ultricies non, ullamcorper et magna. Cras ornare mi eget magna vulputate fringilla eu vel nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus vel magna ut purus laoreet fermentum quis non ante. Ut malesuada risus vitae lectus congue vulputate. Pellentesque viverra lacinia neque, vitae commodo eros condimentum et. Maecenas metus massa, posuere ac magna vel, lobortis dapibus arcu. Etiam at urna at nisl facilisis tincidunt sed non sem. Aenean malesuada felis condimentum dolor venenatis, in molestie quam posuere. Sed malesuada placerat est, sit amet euismod turpis iaculis a.<br>Nam libero eros, iaculis eu mauris vel, ullamcorper imperdiet arcu. Morbi porttitor risus urna, quis malesuada magna iaculis nec. Sed fringilla feugiat odio eget mattis. Suspendisse ac felis dui. Donec pellentesque mi vel urna venenatis, sed varius nunc molestie. Curabitur feugiat lectus nec nibh facilisis ultrices. Pellentesque porttitor suscipit vestibulum. Donec eget ante porttitor, faucibus est non, cursus diam. Nulla facilisi. Fusce in ipsum sit amet enim sollicitudin porttitor et sit amet nisl. Pellentesque convallis ornare nunc sed pretium. Praesent sed facilisis tellus. Nullam finibus eros est. Nulla imperdiet augue nulla. Proin laoreet mauris in eros laoreet consectetur. Nulla lacinia, felis vitae vestibulum pharetra, ante tortor rhoncus libero, non maximus tortor dolor et lectus.'
    , './img/espacios/imagen_espacio_09.jpg'
    , NULL
    , 9
    , FALSE
);

/*
 * DECIMA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '010'
    , 'Zona Computadores'
    , 'direct_use'
    , FALSE
    , ''
    , NULL
    , 'DECIMO Texto para el décimo espacio <br><br> con salto de líneaLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porttitor, justo vel porttitor faucibus, tortor nunc commodo augue, at rhoncus urna mauris non sem. Sed nec mauris purus. Mauris fermentum at lorem et egestas. Donec iaculis dictum dolor, vel auctor nibh scelerisque sit amet. Aenean pellentesque consectetur dui, at rutrum nunc. Fusce accumsan urna eu quam pretium euismod. Integer ac ante est. Maecenas lorem sem, venenatis sit amet sollicitudin quis, tincidunt sed magna. Maecenas ultricies orci nec neque faucibus, nec viverra sapien tincidunt.<br>Fusce convallis vestibulum velit, in ornare augue suscipit eu. Integer sapien purus, dapibus id ultricies non, ullamcorper et magna. Cras ornare mi eget magna vulputate fringilla eu vel nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus vel magna ut purus laoreet fermentum quis non ante. Ut malesuada risus vitae lectus congue vulputate. Pellentesque viverra lacinia neque, vitae commodo eros condimentum et. Maecenas metus massa, posuere ac magna vel, lobortis dapibus arcu. Etiam at urna at nisl facilisis tincidunt sed non sem. Aenean malesuada felis condimentum dolor venenatis, in molestie quam posuere. Sed malesuada placerat est, sit amet euismod turpis iaculis a.<br>Nam libero eros, iaculis eu mauris vel, ullamcorper imperdiet arcu. Morbi porttitor risus urna, quis malesuada magna iaculis nec. Sed fringilla feugiat odio eget mattis. Suspendisse ac felis dui. Donec pellentesque mi vel urna venenatis, sed varius nunc molestie. Curabitur feugiat lectus nec nibh facilisis ultrices. Pellentesque porttitor suscipit vestibulum. Donec eget ante porttitor, faucibus est non, cursus diam. Nulla facilisi. Fusce in ipsum sit amet enim sollicitudin porttitor et sit amet nisl. Pellentesque convallis ornare nunc sed pretium. Praesent sed facilisis tellus. Nullam finibus eros est. Nulla imperdiet augue nulla. Proin laoreet mauris in eros laoreet consectetur. Nulla lacinia, felis vitae vestibulum pharetra, ante tortor rhoncus libero, non maximus tortor dolor et lectus.'
    , './img/espacios/imagen_espacio_10.jpg'
    , NULL
    , 10
    , FALSE
);

/*
 * UNDECIMA ZONA
 */
INSERT INTO BSP_ZONES (
      ZONE_CODE
    , ZONE_TITLE
    , ZONE_TYPE
    , ZONE_VISIBILITY
    , ZONE_VECTOR_SRC
    , ZONE_VECTOR_BASE64
    , ZONE_HTML_DESCRIPTION
    , ZONE_IMAGE_SRC
    , ZONE_IMAGE_BASE64
    , ZONE_ORDER
    , ZONE_STATUS
) VALUES
(
      '011'
    , 'Salas de Estudio'
    , 'scheduled_request'
    , FALSE
    , ''
    , NULL
    , 'UNDECIMO Texto para el undécimo espacio <br><br> con salto de líneaLorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce porttitor, justo vel porttitor faucibus, tortor nunc commodo augue, at rhoncus urna mauris non sem. Sed nec mauris purus. Mauris fermentum at lorem et egestas. Donec iaculis dictum dolor, vel auctor nibh scelerisque sit amet. Aenean pellentesque consectetur dui, at rutrum nunc. Fusce accumsan urna eu quam pretium euismod. Integer ac ante est. Maecenas lorem sem, venenatis sit amet sollicitudin quis, tincidunt sed magna. Maecenas ultricies orci nec neque faucibus, nec viverra sapien tincidunt.<br>Fusce convallis vestibulum velit, in ornare augue suscipit eu. Integer sapien purus, dapibus id ultricies non, ullamcorper et magna. Cras ornare mi eget magna vulputate fringilla eu vel nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Phasellus vel magna ut purus laoreet fermentum quis non ante. Ut malesuada risus vitae lectus congue vulputate. Pellentesque viverra lacinia neque, vitae commodo eros condimentum et. Maecenas metus massa, posuere ac magna vel, lobortis dapibus arcu. Etiam at urna at nisl facilisis tincidunt sed non sem. Aenean malesuada felis condimentum dolor venenatis, in molestie quam posuere. Sed malesuada placerat est, sit amet euismod turpis iaculis a.<br>Nam libero eros, iaculis eu mauris vel, ullamcorper imperdiet arcu. Morbi porttitor risus urna, quis malesuada magna iaculis nec. Sed fringilla feugiat odio eget mattis. Suspendisse ac felis dui. Donec pellentesque mi vel urna venenatis, sed varius nunc molestie. Curabitur feugiat lectus nec nibh facilisis ultrices. Pellentesque porttitor suscipit vestibulum. Donec eget ante porttitor, faucibus est non, cursus diam. Nulla facilisi. Fusce in ipsum sit amet enim sollicitudin porttitor et sit amet nisl. Pellentesque convallis ornare nunc sed pretium. Praesent sed facilisis tellus. Nullam finibus eros est. Nulla imperdiet augue nulla. Proin laoreet mauris in eros laoreet consectetur. Nulla lacinia, felis vitae vestibulum pharetra, ante tortor rhoncus libero, non maximus tortor dolor et lectus.'
    , './img/espacios/imagen_espacio_11.jpg'
    , NULL
    , 11
    , FALSE
)
