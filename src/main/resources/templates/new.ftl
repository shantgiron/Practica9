<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Cliente HTML5</title>

    <!-- Bootstrap core CSS -->
    <link href="niceTemplate/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="niceTemplate/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="niceTemplate/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="niceTemplate/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="niceTemplate/lineicons/style.css">

    <!-- Custom styles for this template -->
    <link href="niceTemplate/css/style.css" rel="stylesheet">
    <link href="niceTemplate/css/style-responsive.css" rel="stylesheet">


    <script src="niceTemplate/js/chart-master/Chart.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<#--DEXIE DB-->
    <script src="https://unpkg.com/dexie@latest/dist/dexie.js"></script>
</head>

<body>
<!--topBar INICIO-->
<!--header start-->
<header class="header black-bg">
    <!--logo start-->
    <a href="/inicio" class="logo"><b>Inicio</b></a>
    <!--logo end-->
</header>
<!--header end-->
<!--topBar FIN-->

<div style="padding-top: 50px" class="container">
    <h1 class="well">Formulario para encuestas</h1>

    <div class="panel panel-primary">

        <div class="panel-body">
            <form  method="post" action="/nuevo" name="myForm">
                <div class="row">

                    <div class="col-md-12">
                        <div class="form-group">
                            <input type="hidden" id="longitud" name="longitud" value=""/>
                            <input type="hidden" id="latitude" name="latitude" value=""/>
                            <fieldset>
                                <div class="form-group">
                                    <label class="control-label" for="id">ID:</label>
                                    <input type="text" id="id" name="id" class="form-control" placeholder="Digite su ID" required autofocus>
                        </div>

                                <div class="form-group">
                                    <label class="control-label" for="nombre">Nombre:</label>
                                    <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Digite su nombre" required autofocus>
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="nivelescolar">Nivel Escolar:</label>
                                    <select name="nivelescolar" id="nivelescolar" class="form-control" required autofocus>
                                        <option value="Basico">Basico</option>
                                        <option value="Medio">Medio</option>
                                        <option value="Grado Universitario">Grado Universitario</option>
                                        <option value="PostGrado">PostGrado</option>
                                        <option value="Doctorado">Doctorado</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="control-label" for="sector">Sector:</label>
                                    <input type="text" id="sector" name="sector" class="form-control" placeholder="Digite su sector" required autofocus>
                                </div>

                                <div class="form-group1">
                                    <button style="border-radius: 30px" class="btn btn-success" type="button" onclick="insertarDB()">Registrar</button>
                                    <button style="border-radius: 30px" class="btn" type="button" onclick="editarDB()">Editar</button>
                                    <button style="border-radius: 30px" class="btn" type="button" onclick="guardarCambios()">Guardar</button>
                                    <button style="border-radius: 30px" class="btn btn-danger" type="button" onclick="borrarEncuesta()">Borrar</button>
                                </div>
                            </fieldset>

                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>


<!--footer INICIO-->
<footer class="site-footer">
    <div class="text-center">
        Realizado por Shantall Giron y Leonardo Castro
        <a href="/inicio" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>
<!--footer FIN-->

<!-- js placed at the end of the document so the pages load faster -->
<script src="niceTemplate/js/jquery.js"></script>
<script src="niceTemplate/js/jquery-1.8.3.min.js"></script>
<script src="niceTemplate/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="niceTemplate/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="niceTemplate/js/jquery.scrollTo.min.js"></script>
<script src="niceTemplate/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="niceTemplate/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="niceTemplate/js/common-scripts.js"></script>

<script type="text/javascript" src="niceTemplate/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="niceTemplate/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="niceTemplate/js/sparkline-chart.js"></script>
<script src="niceTemplate/js/zabuto_calendar.js"></script>

<script type="application/javascript">
    $(document).ready(function () {
        $("#date-popover").popover({html: true, trigger: "manual"});
        $("#date-popover").hide();
        $("#date-popover").click(function (e) {
            $(this).hide();
        });
        $("#my-calendar").zabuto_calendar({
            action: function () {
                return myDateFunction(this.id, false);
            },
            action_nav: function () {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [
                {type: "text", label: "Special event", badge: "00"},
                {type: "block", label: "Regular event", }
            ]
        });
    });
    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
    //dependiendo el navegador busco la referencia del objeto.
    var indexedDB = window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || window.msIndexedDB
    //indicamos el nombre y la versión
    var dataBase = indexedDB.open("encuestado_db", 1);
    //se ejecuta la primera vez que se crea la estructura
    //o se cambia la versión de la base de datos.
    dataBase.onupgradeneeded = function (e) {
        console.log("Creando la estructura de la tabla");
        //obteniendo la conexión activa
        active = dataBase.result;
        //creando la colección:
        //En este caso, la colección, tendrá un ID autogenerado.
        var encuestados = active.createObjectStore("encuestados", {keyPath: 'id', autoIncrement: false});
        //creando los indices. (Dado por el nombre, campo y opciones)
        encuestados.createIndex('por_id', 'id', {unique: true});
    };
    function insertarDB() {
        var active_db = dataBase.result;
        var tx = active_db.transaction(["encuestados"], "readwrite");
        var id_encuestado = document.getElementById("id").value;
        var nombre_encuestado = document.getElementById("nombre").value;
        var nivelescolar_encuestado = document.getElementById("nivelescolar").value;
        var sector_encuestado = document.getElementById("sector").value;
        var latitude_encuestado = document.getElementById("latitude").value;
        var longitud_encuestado = document.getElementById("longitud").value;
        var encuestados = tx.objectStore("encuestados");
        request = encuestados.add({
            id: id_encuestado,
            nombre: nombre_encuestado,
            nivelescolar: nivelescolar_encuestado,
            sector: sector_encuestado,
            longitud: longitud_encuestado,
            latitud: latitude_encuestado
        });
        alert("Insertado en la BD Local");
    }
    function editarDB() {
        //abriendo la transacción en modo escritura.
        var active_db = dataBase.result;
        var tx = active_db.transaction(["encuestados"], "readwrite");
        var encuestados = tx.objectStore("encuestados");
        //buscando paste por la referencia al key.
        encuestados.get(document.getElementById("id").value).onsuccess = function(e) {
            var resultado = e.target.result;
            console.log("los datos: "+JSON.stringify(resultado));
            if(resultado !== undefined){
                document.querySelector("#nombre").value = resultado.nombre;
                document.querySelector("#sector").value = resultado.sector;
                document.querySelector("#nivelescolar").value = resultado.nivelescolar;
            }else{
                console.log("Encuesta no encontrado...");
            }
        };
    }
    function guardarCambios(){
        //abriendo la transacción en modo escritura.
        var active_db = dataBase.result;
        var tx = active_db.transaction(["encuestados"], "readwrite");
        var encuestados = tx.objectStore("encuestados");
        //buscando paste por la referencia al key.
        encuestados.get(document.getElementById("id").value).onsuccess = function(e) {
            var resultado = e.target.result;
            console.log("los datos: "+JSON.stringify(resultado));
            if(resultado !== undefined){
                resultado.nombre= document.querySelector("#nombre").value;
                resultado.sector= document.querySelector("#sector").value ;
                resultado.nivelEscolar = document.querySelector("#nivelescolar").value ;
                resultado.latitude= document.querySelector("#latitude").value.toString();
                resultado.longitud= document.querySelector("#longitud").value.toString();
                var solicitudUpdate = encuestados.put(resultado);
                //eventos.
                solicitudUpdate.onsuccess = function (e) {
                    console.log("los datos: "+JSON.stringify(resultado));
                    console.log("Datos Actualizados....");
                }
                solicitudUpdate.onerror = function (e) {
                    console.error("Error Datos Actualizados....");
                }
            }else{
                console.log("Encuesta no encontrada...");
            }
        };
    }
    function borrarEncuesta() {
        //abriendo la transacción en modo escritura.
        var active_db = dataBase.result;
        var tx = active_db.transaction(["encuestados"], "readwrite");
        var encuestados = tx.objectStore("encuestados");
        //buscando paste por la referencia al key.
        encuestados.delete(document.getElementById("id").value).onsuccess = function(e) {
            console.log("Encuesta eliminado...");
        };
    }
    //Geolocalizacion
    var id, cantidad = 0;
    //Indica las opciones para llamar al GPS.
    var opcionesGPS = {
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0
    }
    $(document).ready(function () {
        console.log("Ejemplo de Geolocalizacion");
        //Obteniendo la referencia directa.
        navigator.geolocation.getCurrentPosition(function (geodata) {
            var coordenadas = geodata.coords;
            $("#posicionGps").text("Latitud: " + coordenadas.latitude + ", Longitud: " + coordenadas.longitude + ", Precisión: " + coordenadas.accuracy + " metros");
            $('input[name="latitude"]').val(coordenadas.latitude);
            $('input[name="longitud"]').val(coordenadas.longitude);
        }, function () {
            $("#posicionGps").text("No permite el acceso del API GEO");
        }, opcionesGPS);
        //Obteniendo el cambio de referencia.
        id = navigator.geolocation.watchPosition(function (geodata) {
            var coordenadas = geodata.coords;
            $("#posicionGps2").text("Latitud: " + coordenadas.latitude + ", Longitud: " + coordenadas.longitude + ", Precisión: " + coordenadas.accuracy + " metros, cantidad: " + cantidad);
            cantidad++;
            if (cantidad >= 5) {
                navigator.geolocation.clearWatch(id);
                console.log("Finalizando la trama")
            }
        }, function (error) {
            //recibe un objeto con dos propiedades: code y message.
            $("#posicionGps2").text("No permite el acceso del API GEO. Codigo: " + error.code + ", mensaje: " + error.message);
        });
    });
</script>
</body>
</html>