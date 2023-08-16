import { createAprendiz } from '../schemas/apprentices.schema.js'
import { pool } from '../db.js'

export const checkApprenticeExist = async (req, res, next) => {
    const { numero_documento_aprendiz } = req.body

    try {
        const [apprenticeExist] = await pool.query('SELECT * FROM aprendices WHERE numero_documento_aprendiz = ?', [numero_documento_aprendiz])

        if (apprenticeExist.length > 0) {
            return res.status(409).json({ message: 'El Aprendiz ya está registrado' })
        }
        next()
    } catch (error) {
        return res.status(500).json({ message: 'Error al verificar el aprendiz' })
        
    }
}

export const createDataAprendiz = (req, res, next) => {
    const { nombres_aprendiz, apellidos_aprendiz, numero_documento_aprendiz, email_aprendiz_sena, email_aprendiz_personal, celular_aprendiz, id_documento, id_ficha } = req.body
    try {
    const { error } = createAprendiz.validate({ nombres_aprendiz, apellidos_aprendiz, numero_documento_aprendiz,  email_aprendiz_sena, email_aprendiz_personal, celular_aprendiz, id_documento, id_ficha })
    if (error !== undefined) return res.status(400).json({ message: 'Los datos del aprendiz no son válidos, verifícalos.' })
    next()
    } catch (error) {
    return res.status(500).json({ message: 'Error inesperado' })
    }
}
