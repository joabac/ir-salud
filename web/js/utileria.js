var espera = 5000;

function mensajeAtencion(titulo, mensaje)
{
	new PNotify({
                    title: titulo,
                    text: mensaje,
                    styling: 'bootstrap3',
                    sticker: false,
                    history: false,
                    animation: 'fade',
                    hide: true,
                    delay: espera,
                    closer: true,
                    shadow: true
            });
        

}

function mensajeError(titulo, mensaje)
{
      new PNotify({
                title: titulo,
                type: 'error',
                text: mensaje,
                styling: 'bootstrap3',
                sticker: false,
                history: false,
                animation: 'fade',
                hide: true,
                delay: espera,
                closer: true,
                shadow: true,
                width: "350px"
        });
         

}


function mensajeErrorTags(mensaje)
{
      new PNotify({
                title: "Error",
                type: 'error',
                text: mensaje,
                styling: 'bootstrap3',
                sticker: false,
                history: false,
                animation: 'fade',
                hide: true,
                delay: espera,
                closer: true,
                shadow: true
        });
         

}

function mensajeInformativo(titulo,mensaje)
{
    
	new PNotify({
                    title: titulo,
                    text: mensaje,
                    styling: 'bootstrap3',
                    sticker: false,
                    history: false,
                    type: 'info',
                    animation: 'fade',
                    hide: true,
                    delay: espera,
                    closer: true,
                    shadow: true
            });

}

function mensajeCargando(titulo,mensaje,referencia)
{
	referencia.push(new PNotify({
            title: titulo,
            text: mensaje,
            styling: 'bootstrap3',
            type: 'info',
            icon: 'picon cargando',
            hide: false,
            history: false,
            closer: true,
            delay: espera,
            sticker: false,
            shadow: true
        })
    );
//        referencia[0].show();

}

function mensajeExito(titulo, mensaje)
{
            new PNotify({
                    title: titulo,
                    type: 'success',
                    text: mensaje,
                    styling: 'bootstrap3',
                    sticker: false,
                    history: false,
                    animation: 'fade',
                    hide: true,
                    delay: espera,
                    closer: true,
                    shadow: true
            });
         

}

function mensajeAyuda(titulo, mensaje) {
    
            new PNotify({
                title:'<span style="style="font-size: 1.5em; color: #000000;">'+titulo+'</span>',
                text: '<span style="color: #000000;">'+mensaje+'</span>', 
                width: '500px',
                min_height: '400px',
                styling: 'bootstrap3',
                sticker: false,
                history: false,
                animation: 'fade',
                hide: false,
                delay: espera,
                closer: true,
                shadow: true
            });
}

function Auditoria(operacion, objeto,id_usuario)
{
    
}


