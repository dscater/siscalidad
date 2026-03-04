import { onMounted, ref } from "vue";

const oProduccion = ref({
    id: 0,
    producto_id: "",
    fecha_inicio: "",
    descripcion: "",
    estado: "",
    fecha_registro: "",
    _method: "POST",
});

export const useProduccions = () => {
    const setProduccion = (item = null) => {
        if (item) {
            oProduccion.value.id = item.id;
            oProduccion.value.producto_id = item.producto_id;
            oProduccion.value.fecha_inicio = item.fecha_inicio;
            oProduccion.value.descripcion = item.descripcion;
            oProduccion.value.estado = item.estado;
            oProduccion.value.fecha_registro = item.fecha_registro;
            oProduccion.value._method = "PUT";
            return oProduccion;
        }
        return false;
    };

    const limpiarProduccion = () => {
        oProduccion.value.id = 0;
        oProduccion.value.producto_id = "";
        oProduccion.value.fecha_inicio = "";
        oProduccion.value.descripcion = "";
        oProduccion.value.estado = "";
        oProduccion.value.fecha_registro = "";
        oProduccion.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oProduccion,
        setProduccion,
        limpiarProduccion,
    };
};
