/// BLOCS
/// Authentication Bloc
/// ----------------------------------------------
// State
const String UNINITIALIZED = 'Uninitialized';
const String UNAUTHENTICATED = 'Unauthenticated';

// Event
const String APPSTARTED = 'AppStarted';
const String LOGGEDIN = 'LoggedIn';
const String LOGGEDOUT = 'LoggedOut';

/// Login and Register Bloc
/// -----------------------------------------------
// Event
const String EMAIL_CHANGED = 'EmailChanged { email : ';
const String PASSWORD_CHANGED = 'PasswordChanged { password: ';
const String SUBMITTED = 'Submitted { email: ';

/// SCREENS
/// Login
/// -----------------------------------------------
const String CREATE_ACCOUNT = 'Crear una cuenta';
const String GOOGLE_BUTTON = 'Conectar con Google';
const String LOGIN_BUTTON = 'Iniciar Sesión';
const String LOGIN_FAILURE = 'Inicio de Sesión fallido';
const String LOGGING_IN = 'Iniciando Sesión... ';
const String LABEL_EMAIL = 'Email';
const String INVALID_EMAIL = 'Email inválido';
const String INVALID_ANSWER = 'Respuesta inválida';
const String LABEL_PASSWORD = 'Contraseña';
const String INVALID_PASSWORD = 'Contraseña inválida';
const String REGISTER_BUTTON = 'Registrar';
const String REGISTERING_IN = 'Registrando... ';
const String REGISTERING_RESPONSE = 'Registrando respuesta...';
const String REGISTER_FAILURE = 'Registro fallido';
const String REGISTER_TITLE = 'Registro';
const String ENTREVISTA_TITLE = 'Mi Entrevista';
const String SPLASH_SCREEN_WELCOME = 'Mi Entrevista';
const String SPLASH_SCREEN_PHRASE = 'Bienvenido \n Aprende y Practica';
const String LOGOUT_BUTTON = 'Cerrar Sesión';
const String TEORIA_BUTTON = 'Aprender';
const String PRACTICA_BUTTON = 'Practicar';
const String INICIO_BUTTON = 'Inicio';


/// NUMBER
const NUMBER_TEN = 10.0;
const NUMBER_EIGHTEEN = 18.0;
const NUMBER_TWENTY = 20.0;
const NUMBER_TWENTY_FOUR = 24.0;
const NUMBER_THIRTY = 30.0;
const NUMBER_FIFTY = 50.0;
const NUMBER_EIGHTY_PERCENT = 0.80;
const NUMBER_THIRTY_PERCENT = 0.30;

/// RUTAS
/// ASSETS
const String ASSETS_LOGO = 'assets/logo_imagen.png';
const String ASSETS_LOGO_TRANS = 'assets/logo.png';
const String PATH_TEORIA = '/teoria';
const String PATH_PRACTICA = '/practica';

/// FRASES
/// HOME - WELCOME
const List<String> LIST_FRASES_INTERVIEW = [
  'Uno de los mayores temores que enfrentamos al buscar empleo es responder preguntas extrañas en las entrevistas de trabajo.',
  'Aunque muchas veces la entrevista parezca desalentador, recuerda que es una oportunidad para mostrar tus fortalezas y tu personalidad.',
  'Para reducir el miedo a una entrevista lo más recomendable es que te prepares correctamente.',
  'Cuando estés frente a la persona que te entrevistara debes olvidarte de todos tus problemas y pensar en que todo saldrá bien, estoy segura que lo puedes hacer.',
  'Solo debes demostrar que eres un buen profesional, ten confianza y la entrevista de trabajo tendrá un resultado positivo para ti.',
  'Este es uno de los momentos más importantes en tu vida profesional y solo depende de ti para que las cosas salgan como las esperas, que tengas suerte en la entrevista laboral.',
  'La entrevista de trabajo es solo un paso más para lograr tu objetivo, habla con seguridad, se honesto y demuestra que eres una persona valiosa en muchos aspectos.',
  'Si una empresa desea entrevistarte es porque considera que cuentas las habilidades necesarias para el cargo, lo único que tienes que hacer es demostrarles que tienen razón.',
  'Muchas personas competirán contigo por el mismo cargo y si quieres tener éxito deberás demostrar en la entrevista laboral que eres mejor que ellos, tú lo puedes hacer, confía en ti.',
  'Las entrevistas de trabajo solo dura unos minutos pero la satisfacción de ser contratado por primera vez es algo que recordaras con alegría por siempre.'
];

const List<String> LIST_FRASES_WELLDONE = [
  'Sólo hay felicidad donde hay virtud y esfuerzo serio, pues la vida no es un juego. (Aristóteles).',
  'Nuestra recompensa se encuentra en el esfuerzo y no en el resultado. Un esfuerzo total es una victoria completa. (Mahatma) Gandhi',
  'Donde haya un árbol que plantar, plántalo tú. Donde haya un error que enmendar, enmiéndalo tú. Donde haya un esfuerzo que todos esquivan, hazlo tú. Sé tú el que aparta la piedra del camino. (Gabriela Mistral).',
  'Con esfuerzo y esperanza todo se alcanza.',
  'Nunca te canses de intentar que tu vida sea mejor, la perseverancia siempre tiene su recompensa.',
  'Tanto más crece el esfuerzo, cuanto más consideramos la grandeza de lo emprendido.',
  'No pierdas las fuerzas porque con este nuevo logro necesitaras muchas extras para continuar tu camino al éxito, animo que aún falta la mejor parte.',
  'Un logro espectacular esta siempre precedido por una preparación espectacular.. (Robert H. Schuller).',
  'Hay hombres que luchan un día y son buenos, hay quienes luchan muchos días y son muy buenos, hay quienes luchan por años y son mejores, pero están los que luchan toda la vida, esos son los imprescindibles.',
  'Quiero felicitarte por tus nuevos logros, una vez más demuestras que todo con esfuerzo vale mucho más la pena',
  'Los resultados son más victoriosos cuando en el camino te toco esforzarte mucho más, felicidades por tu nuevo logro',
  'La pasión que pusiste durante todo este tiempo se verá reflejada en el amor que le tendrás a tu carrera, felicidades por tu nuevo logro',
];

const String APRENDE_FRASE = '¡Mientras más conocimiento adquieras, tu rango irá subiendo hasta llegar a Gran Maestro del conocimiento de entrevistas!';
//'En este módulo aprenderás conceptos de la entrevista de trabajo mediante texto, imágenes y/o videos. \n\n ¡Mientras más conocimiento adquieras, tu nivel irá subiendo hasta llegar a Gran Maestro del conocimiento de entrevistas!';
const String PRACTICA_FRASE = 'Cuando respondas a una pregunta, se te mostrará la respuesta más parecida que haya sido ingresada por otro usuario';
// 'En este módulo podrás practicar respondiendo preguntas de acuerdo a las competencias que más se evaluan para los perfiles de Analista, Programador y Administrador de Sistemas. \n\n Cuando respondas a una pregunta, se te mostrará la respuesta más parecida que haya sido ingresada por otro usuario';

/// STRINGS
const String ID_GENERAL = '00';
const String ALEATORIO = 'Aleatorio';
const String DESCRIPCION_ALEATORIO = 'Conjunto aleatorio de las competencias';
const String ICONGLOBE = 'globe';