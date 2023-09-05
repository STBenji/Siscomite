import "./Home.css";
import React, { useState } from "react";
import { Card } from "../Utils/Card/Card";
import { Button } from "@nextui-org/react";
import { Sliderbar } from "../Sliderbar/Sliderbar";
import { Footer } from "../Footer/Footer";
import { Link } from "react-router-dom";
import { Notify } from "../Utils/NotifyBar/NotifyBar";

const Home = () => {
  const data = [
    { titleHome: "Solicitudes", image: "/image/solicitudes.webp", descripciónHome: "Aquí podrás ver las solicitudes que se han realizado y su estado de aprobación.", Link: "/requests" },
    { titleHome: "Crear solicitud", image: "/image/solicitud.webp", descripciónHome: "Aquí podrás crear una solicitud para un comité de evalución..", Link: "/create" },
    { titleHome: "Fichas", image: "/image/fichas.webp", descripciónHome: "Aquí podrás visualizar las fichas del CTM.", Link: "/groups" },
    { titleHome: "Reglamento", image: "/image/reglamento.webp", descripciónHome: "Aquí podrás ver el reglamento para consultar los artículos necesarios.", Link: "/rules" },
  ];

  const [notifyOpen, setNotifyOpen] = useState(false);

  const toggleNotify = () => {
    setNotifyOpen(!notifyOpen);
  };

  return (
    <>
      <main className="flex h-screen w-full">
        <Sliderbar />
        <section className="w-full overflow-auto ">
          <section className="flex max-w-[100%]">
            <section className="w-full">
              <header className=" p-8 flex justify-center text-[23px]">
                <h1 className=" text-[2rem] place-items-center font-extrabold border-b-[1.5px] border-[#0799b6]">Siscomite</h1>
                <section className="relative left-[20%] cursor-pointer ">
                  {notifyOpen ? (
                    <></>
                  ) : (
                    <>
                      <Button className="hola" radius="full" variant="flat" color="secondary" onClick={toggleNotify}>
                        Mensajes
                        <i className="fi fi-ss-bell pl-[.5rem]" />
                      </Button>
                    </>
                  )}
                </section>
              </header>
              <section className="flex-wrap flex items-center justify-center gap-20 px-[1rem]">
                {data.map((x, i) => (
                  <Link to={x.Link} key={i}>
                    <section className="h-[28%] text-black cardHome " style={{ transition: "0.4s ease-in-out" }}>
                      <Card inside image={x.image} titleHome={x.titleHome} descripciónHome={x.descripciónHome} />
                    </section>
                  </Link>
                ))}
              </section>
              <Footer />
            </section>
            <section className=" ">
              <Notify isOpen={notifyOpen} toggleNotify={toggleNotify} />
            </section>
          </section>
        </section>
      </main>
    </>
  );
};

export { Home };
