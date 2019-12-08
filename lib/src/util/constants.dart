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
const String LABEL_PASSWORD = 'Contraseña';
const String INVALID_PASSWORD = 'Contraseña inválida';
const String REGISTER_BUTTON = 'Registrar';
const String REGISTERING_IN = 'Registrando... ';
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

/// STRINGS
const String ID_GENERAL = '00';
const String ALEATORIO = 'Aleatorio';
const String DESCRIPCION_ALEATORIO = 'Conjunto aleatorio de las competencias';
const String ICONGLOBE = 'globe';