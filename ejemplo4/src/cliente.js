// mi fichero cliente lanzará peticiones a la API REST
const  traerPostVinos = async() => {
   try {
    const reponse = await fetch("http://192.168.70.104:4000/")
    const data = await reponse.json();
    console.log(data)
    
   } catch (error) {
        console.error("Error al traer los posts",error);
   }
}
traerPostVinos()

//async fuction blebleble(){}
//async // await