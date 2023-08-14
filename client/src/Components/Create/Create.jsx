import "./Create.css";
import React, { useState } from "react";
import { Footer } from "../Footer/Footer";
import { Sliderbar } from "../Sliderbar/Sliderbar";
import { RadioGroup, Radio } from "@nextui-org/react";
import { Tabs, Tab, Card, CardBody, CardHeader } from "@nextui-org/react";
import { Textarea } from "@nextui-org/react";
import { Search } from "../Search/Search";
import { Dropdown, DropdownTrigger, DropdownMenu, DropdownItem, Button } from "@nextui-org/react";

const Create = () => {
  const [selectedAprendizOption, setSelectedAprendizOption] = useState(null);

  const [selectedKeys, setSelectedKeys] = React.useState(new Set(["Coordinador"]));

  const selectedValue = React.useMemo(() => Array.from(selectedKeys).join(", ").replaceAll("_", " "), [selectedKeys]);

  const handleAprendizOptionClick = (option) => {
    setSelectedAprendizOption(option);
  };

  let tabs = [
    {
      id: "1 ",
      label: "Académicas",
      content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    },
    {
      id: "2",
      label: "Disciplinarios",
      content: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    },
    {
      id: "3",
      label: "Otro",
      content: <Textarea label="Descripción" labelPlacement="outside" placeholder="Ingresa tu descipción" className="max-w-[300px]"  />
      
    },
  ];

  return (
    <main className="relative h-screen flex">
      <Sliderbar />
      <section className="w-full">
        <header className="grid place-items-center py-[.5rem] relative top-[.5rem]">
          <h1 className="text-2xl font-semibold">Toda la información debe ser la registrada en Sofía Plus</h1>
          <section className="bg-white relative top-[1rem]  place-items-center flex w-[90%] p-[.5rem] p shadow-lg rounded-xl justify-between">
            <section>
              <RadioGroup orientation="horizontal">
                <Radio value="buenos-aires">Grupal</Radio>
                <Radio value="sydney">Individual</Radio>
              </RadioGroup>
            </section>
            <section>
              <Dropdown>
                <DropdownTrigger>
                  <Button variant="flat" className="capitalize" color="primary">
                    {selectedValue}
                    <i className="fi fi-rr-angle-small-down text-[1.5rem]" />
                  </Button>
                </DropdownTrigger>
                <DropdownMenu aria-label="Single selection actions" variant="flat" disallowEmptySelection selectionMode="single" selectedKeys={selectedKeys} onSelectionChange={setSelectedKeys}>
                  <DropdownItem key="Marianela Henao Atehortua">Marianela Henao Atehortua</DropdownItem>
                  <DropdownItem key="Jaime León Vergara Areiza">Jaime León Vergara Areiza</DropdownItem>
                  <DropdownItem key="Sergio Soto Henao">Sergio Soto Henao</DropdownItem>
                  <DropdownItem key="Mauro Isaías Arango Vanegas">Mauro Isaías Arango Vanegas</DropdownItem>
                </DropdownMenu>
              </Dropdown>
            </section>
          </section>
        </header>
        <section className=" relative top-[1.6rem] place-items-center grid grid-cols-2  gap-0 ">
          <section className="w-[85%] ml-[3rem]" >
            <section className=" relative ">
              <Search className="relative " placeholder={"Buscar Instructor"} icon={<i class="fi fi-br-search relative cursor-pointer right-[3rem]" />} />
              <section className="bg-[#2E323E] w-[97%]  h-[4rem] relative shadow-lg top-[.5rem] rounded-xl grid justify-center">
                <h3 className="text-white justify-center  border-b-white">Sin seleccionar aprendices</h3>
              </section>
            </section>
            <section className="relative top-[3rem]">
              <Search className="relative w-[100%]  " placeholder={"Buscar Instructor"} icon={<i class="fi fi-br-search relative cursor-pointer right-[3rem]" />} />
              <section className="bg-[#2E323E] w-[97%]  relative shadow-lg top-[.5rem] rounded-xl  ">
                <h3 className="text-white grid justify-center ">Sin seleccionar instructores</h3>
                <p className="text-white relative mx-5  w-[90%]  border-t-2 border-blue-500">
                  <ul className="flex justify-between text-[13px] py-[.5rem]">
                    <li>23454545</li>
                    <li>Guillermo Stiven Bejumea Morales</li>
                  </ul>
                </p>
              </section>
            </section>
            <section className="py-[2rem] relative top-[2.5rem] flex gap-4 justify-between items-center  ">
              <section className=" w-[55%]">
                <Textarea label="Descripción" labelPlacement="outside" placeholder="Ingresa tu descipción" className="max-w-[300px] " />
              </section>
              <section className="">
                <label className="inline-block bg-[#2E323E] text-white p-[13px] rounded-xl cursor-pointer select-none">
                  Subir evidencia
                  <i className="fi fi-rr-upload px-[.5rem]" />
                  <input type="file" className="hidden" />
                </label>
              </section>
            </section>
          </section>

          <section className="mr-[3.1rem] w-[85%] h-full">
            <div className="flex w-full  flex-col">
              <Tabs aria-label="Dynamic tabs" items={tabs}>
                {(item) => (
                  <Tab key={item.id} title={item.label}>
                    <Card>
                      <CardBody>{item.content}</CardBody>
                    </Card>
                  </Tab>
                )}
              </Tabs>
            </div>
          </section>
          <section className=" absolute top-[25rem] ">
            <Button className="" size="lg" color="primary">
              Enviar
              <i className="fi fi-br-check"></i>
            </Button>
          </section>
        </section>
        <Footer />
      </section>
    </main>
  );
};

export { Create };
