import React, { useState } from 'react'
import { Button } from '@nextui-org/react'
import './Alerts.css'

export const Alerts = ({ cerrarAlert, contenido, recordatorio, descargarExcel }) => {
  // Estado para controlar si la alerta debe mostrarse
  const [showAlert, setShowAlert] = useState(true)

  // Cerrar alerta
  const alertClose = () => {
    setShowAlert(false)
    cerrarAlert()
  }

  return (
    <>
      {showAlert && (
        <main className="h-screen w-screen absolute inset-0 z-20 flex justify-center">
          <section className="h-[11rem] w-[36rem] p-4 bg-white rounded-xl shadow-lg z-20 mt-5 border-4 border-yellow-500 cardAlert">
            <header className="flex gap-4 justify-between">
              <section className="w-full justify-center flex text-[24px] font-bold">
                <i className="icon fi fi-sr-triangle-warning text-warning pr-4" />
                <h2>Importante</h2>
              </section>
              <i className={`fi fi-br-cross text-xs cursor-pointer`} onClick={alertClose}></i>
            </header>
            <section className="h-[62%] mt-[1rem] grid place-items-center">
              <p className="text-[16px]">{contenido}</p>
              <p className="text-[16px]">{recordatorio}</p>

              {descargarExcel && (
                <Button color="success" size="sm" variant="flat" className="">
                  Descargar excel <i className="fi fi-rr-download"></i>
                </Button>
              )}
            </section>
          </section>
          <section className="inset-0 bg-[#00000068] -z-10 fixed flex items-center justify-center " onClick={alertClose} />
        </main>
      )}
    </>
  )
}