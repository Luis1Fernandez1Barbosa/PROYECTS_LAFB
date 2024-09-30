const paginaInicio = (req,res) => {
    res.render("inicio",{
        pagina:"inicio"
    });
};

const paginaAddHotel = (req,res) => {
    res.render("addHotel", {
        pagina : "Añadir Hotel"
    })
}

const paginaAddGerente = (req,res) => {
    res.render("addGerente", {
        pagina: "Añadir Gerente"
    })
}

const paginaAddHabitacion = (req,res) => {
    res.render("addHabitacion",{
        pagina:"Añadir Habitacion",
        id_htl:req.query.id_htl
    })
}

const addHotelInter = (req,res) => {
    console.log(req.query);
    res.render("addHotel",{
        pagina:"Añadir Hotel",
        idgrt:req.query.idgrt,
        grtname:req.query.grtname
    });
}

export {
    paginaInicio,
    paginaAddHotel,
    paginaAddGerente,
    paginaAddHabitacion,
    addHotelInter
};