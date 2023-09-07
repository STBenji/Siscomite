import './Create.css'
import React, { useEffect, useState } from 'react'
import jwtDecode from 'jwt-decode'
import Cookie from 'js-cookie'

import { Footer } from '../Footer/Footer'
import { Notify } from '../Utils/NotifyBar/NotifyBar'
import { Sliderbar } from '../Sliderbar/Sliderbar'
import {
  Card,
  CardBody,
  Textarea,
  CheckboxGroup,
  Checkbox,
  Dropdown,
  DropdownTrigger,
  DropdownMenu,
  DropdownItem,
  Button,
  RadioGroup,
  Radio,
  Tooltip,
  Tabs,
  Tab
} from '@nextui-org/react'
import { Search } from '../Search/Search'
import {
  getTeacherByName,
  getApprenticesByName,
  getApprenticesById
} from '../../api/httpRequest'

const Create = () => {
  const [selectedAprendizOption, setSelectedAprendizOption] = useState(null)

  const [teacherSearch, setTeacherSearch] = useState([])
  const [userSearch, setUserSearch] = useState([])

  const [selectedApprentice, setSelectedApprentice] = useState([])
  const [error, setError] = useState(null)
  const [errorUser, setErrorUser] = useState(null)
  const [userID, setUserID] = useState('')

  const [selectedKeys, setSelectedKeys] = React.useState(
    new Set(['Coordinador'])
  )
  const selectedValue = React.useMemo(
    () => Array.from(selectedKeys).map((key) => key.replace(/_/g, ' ')),
    [selectedKeys]
  )

  // Drop tipo falta
  const [selectedFalta, setSelectedFalta] = React.useState(
    new Set(['Calificación'])
  )
  const selectedValueFalta = React.useMemo(
    () => Array.from(selectedFalta).join(', ').replaceAll('_', ' '),
    [selectedFalta]
  )

  const [tipoSolicitud, setTipoSolicitud] = useState(null)

  const getTeacher = async (nombres) => {
    try {
      if (nombres.trim() === '') {
        setTeacherSearch([])
        setError(null)
        return
      } else {
        setError(null)
        const response = await getTeacherByName(nombres)
        setTeacherSearch(response.data.user)
      }
    } catch (error) {
      const message = error.response.data.message
      setError(message)
      setTeacherSearch([])
    }
  }

  const getUser = async (nombres) => {
    try {
      if (nombres.trim() === '') {
        setUserSearch([])
        setError(null)
        return
      } else {
        setErrorUser(null)
        const response = await getApprenticesByName(nombres)
        setUserSearch(response.data.user)
      }
    } catch (error) {
      const message = error.response.data.message
      setErrorUser(message)
      setUserSearch([])
      setSelectedApprentice([])
    }
  }
  useEffect(() => {
    const infoUser = Cookie.get('token')
    const decoded = jwtDecode(infoUser)
    setUserID(decoded.id_usuario)
    // console.log("hola");
  }, [])

  const sendData = () => {
    if (selectedApprentice[0] === undefined)
      return alert('debe seleccionar un aprendiz, para hacer la solicitud')

    const dataValue = {
      tipo_solicitud: tipoSolicitud, // Agregar el valor del radio
      nombre_coordinacion: selectedValue.join(', '), // Agregar el valor del dropdown
      // id_causa,
      id_usuario_solicitante: userID,
      id_aprendiz: selectedApprentice[0].id_aprendiz
    }
    console.log(dataValue)
  }

  const handleTeacherClick = async (userId) => {
    console.log('ID del instructor:', userId)
  }

  const handleUserClick = async (userId) => {
    try {
      const response = await getApprenticesById(userId)
      const res = response.data.result
      setSelectedApprentice(res)
      setUserSearch([])
      setTeacherSearch([])
    } catch (error) {
      console.error('Error obteniendo detalles del aprendiz:', error)
    }
  }

  const removeApprentices = (apprenticeId) => {
    setSelectedApprentice((prevApprentices) =>
      prevApprentices.filter(
        (apprentice) => apprentice.id_aprendiz !== apprenticeId
      )
    )
    console.log('Aprendiz eliminado:', apprenticeId)

    // Imprime el estado después de eliminar para verificar si se actualiza correctamente
    console.log(
      'Aprendices seleccionados después de eliminar:',
      selectedApprentice
    )
  }

  // Barra de notificaciones
  const [notifyOpen, setNotifyOpen] = useState(false)

  const toggleNotify = () => {
    setNotifyOpen(!notifyOpen)
  }

  return (
    <main className="relative h-screen flex ">
      <Sliderbar />
      <section className="w-full overflow-auto">
        <section className="fixed z-20 w-[20rem] right-0">
          <Notify isOpen={notifyOpen} toggleNotify={toggleNotify} />
        </section>
        <header className="grid place-items-center py-[.5rem] relative top-[.5rem]">
          <section className="flex">
            <h1 className="text-2xl font-semibold">Crear solicitud</h1>
            <section className="absolute right-[15%] cursor-pointer ">
              {notifyOpen ? (
                <></>
              ) : (
                <>
                  <section
                    className="bg-blue-200 rounded-full w-[2rem] h-[2rem] grid place-items-center"
                    onClick={toggleNotify}
                  >
                    <i className="fi fi-ss-bell text-blue-400 p-[.3rem] " />
                  </section>
                </>
              )}
            </section>
          </section>
          <section className="bg-white relative top-[1rem] place-items-center  grid grid-cols-3 gap-[6rem]  w-[90%] p-[.5rem] p shadow-lg rounded-xl">
            <section>
              <RadioGroup
                orientation="horizontal"
                onChange={(e) => setTipoSolicitud(e.target.value)}
              >
                <Radio value="Grupal" isDisabled={true}>
                  Grupal
                </Radio>
                <Radio value="Individual">Individual</Radio>
              </RadioGroup>
            </section>

            <section>
              <Dropdown>
                <DropdownTrigger>
                  <Button variant="flat" className="capitalize" color="primary">
                    {selectedValueFalta}
                    <i className="fi fi-rr-angle-small-down text-[1.5rem]" />
                  </Button>
                </DropdownTrigger>
                <DropdownMenu
                  aria-label="Single selection actions"
                  variant="flat"
                  disallowEmptySelection
                  selectionMode="single"
                  selectedFalta={selectedFalta}
                  onSelectionChange={setSelectedFalta}
                >
                  <DropdownItem key="leve">Leve</DropdownItem>
                  <DropdownItem key="grave">Grave</DropdownItem>
                  <DropdownItem key="gravísimas">Gravísimas</DropdownItem>
                </DropdownMenu>
              </Dropdown>
            </section>

            <section>
              <Dropdown>
                <DropdownTrigger>
                  <Button variant="flat" className="capitalize" color="primary">
                    {selectedValue}
                    <i className="fi fi-rr-angle-small-down text-[1.5rem]" />
                  </Button>
                </DropdownTrigger>
                <DropdownMenu
                  aria-label="Single selection actions"
                  variant="flat"
                  disallowEmptySelection
                  selectionMode="single"
                  selectedKeys={selectedKeys}
                  onSelectionChange={setSelectedKeys}
                >
                  <DropdownItem key="Marianela Henao Atehortua">
                    Marianela Henao Atehortua
                  </DropdownItem>
                  <DropdownItem key="Jaime León Vergara Areiza">
                    Jaime León Vergara Areiza
                  </DropdownItem>
                  <DropdownItem key="Sergio Soto Henao">
                    Sergio Soto Henao
                  </DropdownItem>
                  <DropdownItem key="Mauro Isaías Arango Vanegas">
                    Mauro Isaías Arango Vanegas
                  </DropdownItem>
                </DropdownMenu>
              </Dropdown>
            </section>
          </section>
        </header>
        <section className=" relative top-[1.6rem] place-items-center grid grid-cols-2  gap-0 ">
          <section className="w-[85%] ml-[3rem] h-full ">
            <section className=" relative ">
              <Search
                className="relative "
                placeholder={'Buscar Instructor'}
                icon={
                  <i className="fi fi-br-search relative cursor-pointer right-[3rem]" />
                }
                searchStudent={getTeacher}
              />
              <section className="bg-[#2E323E] w-[97%] relative shadow-lg top-[.5rem] rounded-xl  ">
                <h3 className="text-white grid justify-center ">
                  Instructores
                </h3>
                <section className="text-white relative mx-5 w-[90%] border-t-2 border-blue-500 p-1">
                  {teacherSearch.length > 0 ? (
                    <>
                      {teacherSearch.map((item) => (
                        <ul
                          className="flex justify-between text-[13px] py-[.5rem] cursor-pointer hover:bg-blue-900 rounded-lg p-2"
                          key={item.id_usuario}
                          onClick={() => handleTeacherClick(item.id_usuario)}
                        >
                          <React.Fragment>
                            <li>{item.numero_documento}</li>
                            <li>{item.nombres + ' ' + item.apellidos}</li>
                            <li>
                              <i className="fi fi-rr-user-add text-green-500 text-[1rem]"></i>
                            </li>
                          </React.Fragment>
                        </ul>
                      ))}
                    </>
                  ) : (
                    <span className="text-white text-center py-[1rem] block">
                      {error ?? 'Ningún instructor seleccionado'}
                    </span>
                  )}
                </section>
              </section>
            </section>
            <section className="relative top-[1rem] ">
              <Search
                className="relative w-[100%]  "
                placeholder={'Buscar aprendiz'}
                icon={
                  <i className="fi fi-br-search relative cursor-pointer right-[3rem]" />
                }
                searchStudent={getUser}
              />
              <section className="bg-[#2E323E] w-[97%] relative shadow-lg top-[.5rem] rounded-xl">
                <h3 className="text-white grid justify-center">Aprendices</h3>
                <section className="text-white relative mx-5 w-[90%] border-t-2 border-blue-500 p-1">
                  {userSearch.length > 0 || selectedApprentice.length > 0 ? (
                    <>
                      {userSearch.map((item) => (
                        <ul
                          className="flex justify-between text-[13px] py-[.5rem] cursor-pointer hover:bg-blue-900 rounded-lg p-2"
                          key={item.id_aprendiz}
                          onClick={() => handleUserClick(item.id_aprendiz)}
                        >
                          <React.Fragment>
                            <li>{item.numero_documento_aprendiz}</li>
                            <li>
                              {item.nombres_aprendiz +
                                ' ' +
                                item.apellidos_aprendiz}
                            </li>
                            <li>
                              <i className="fi fi-rr-user-add text-green-500 text-[1rem]"></i>
                            </li>
                          </React.Fragment>
                        </ul>
                      ))}
                      {selectedApprentice.map((item) => (
                        <ul
                          className="flex justify-between text-[13px] py-[.5rem] cursor-pointer hover:bg-blue-900 rounded-lg p-2"
                          key={item.id_aprendiz}
                          onClick={() => handleUserClick(item.id_aprendiz)}
                        >
                          <React.Fragment>
                            <li>{item.numero_documento_aprendiz}</li>
                            <li>
                              {item.nombres_aprendiz +
                                ' ' +
                                item.apellidos_aprendiz}
                            </li>
                            <li>
                              <i
                                className="fi fi-br-remove-user text-red-500 text-[1rem]"
                                onClick={() =>
                                  removeApprentices(item.id_aprendiz)
                                }
                              ></i>
                            </li>
                          </React.Fragment>
                        </ul>
                      ))}
                    </>
                  ) : (
                    <span className="text-white text-center py-[1rem] block">
                      {errorUser ?? 'Ningún aprendiz seleccionado'}
                    </span>
                  )}
                </section>
              </section>
            </section>
            <section className="py-[.5rem] relative top-[2.1rem] place-items-center grid grid-cols-2 gap-4 ">
              <section className=" w-full">
                <Textarea
                  label="Descripción"
                  labelPlacement="outside"
                  placeholder="Ingresa tu descripción"
                  className="max-w-[300px] "
                />
              </section>
              <section className="">
                <Tooltip
                  showArrow={true}
                  color="danger"
                  content="La evidencia tiene que ser en un PDF"
                >
                  <label className="inline-block bg-[#2E323E] text-white p-[13px] rounded-xl cursor-pointer select-none">
                    Subir evidencia
                    <i className="fi fi-rr-upload px-[.5rem]" />
                    <input type="file" className="hidden" />
                  </label>
                </Tooltip>
              </section>
            </section>
          </section>

          <section className="mr-[3.1rem] w-[85%] h-full">
            <section className="flex w-full h-full flex-col">
              <Tabs>
                <Tab key="academica" title="Acádemicas">
                  <Card className="overflow-auto  h-full ">
                    <CardBody className="gap-1">
                      <CheckboxGroup>
                        <Checkbox value="rules" className="flex  items-start">
                          Feliz
                        </Checkbox>
                        <Checkbox value="tati" className="flex  items-start">
                          Estoy
                        </Checkbox>
                      </CheckboxGroup>
                    </CardBody>
                  </Card>
                </Tab>
                <Tab key="disciplinarias" title="Disciplinarias">
                  <Card>
                    <CardBody>
                      <CheckboxGroup>
                        <Checkbox value="rules" className="flex  items-start">
                          Amigos
                        </Checkbox>
                        <Checkbox value="tati" className="flex  items-start">
                          holi
                        </Checkbox>
                      </CheckboxGroup>
                    </CardBody>
                  </Card>
                </Tab>
                <Tab key="otros" title="Otros">
                  <Card>
                    <CardBody>
                      <CheckboxGroup>
                        <Checkbox value="rules" className="flex  items-start">
                          No se que
                        </Checkbox>
                        <Checkbox value="tati" className="flex  items-start">
                          Poner
                        </Checkbox>
                      </CheckboxGroup>
                    </CardBody>
                  </Card>
                </Tab>
              </Tabs>
            </section>
          </section>
        </section>
        <section className="grid place-items-center relative top-[2rem] ">
          <Button className="" size="md" color="primary" onClick={sendData}>
            Enviar
            <i className="fi fi-br-check"></i>
          </Button>
        </section>
        <Footer />
      </section>
    </main>
  )
}

export { Create }
