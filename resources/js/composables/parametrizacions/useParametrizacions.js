import { onMounted, ref } from "vue";

const oParametrizacion = ref({
    id: 0,
    producto_id: "",
    parametrizacions: [],
    _method: "POST",
});

export const useParametrizacions = () => {
    const setParametrizacion = (item = null) => {
        if (item) {
            oParametrizacion.value.id = item.id;
            oParametrizacion.value.producto_id = item.producto_id;
            oParametrizacion.value.parametrizacions = item.parametrizacions;
            oParametrizacion.value._method = "PUT";
            return oParametrizacion;
        }
        return false;
    };

    const limpiarParametrizacion = () => {
        oParametrizacion.value.id = 0;
        oParametrizacion.value.producto_id = "";
        oParametrizacion.value.parametrizacions = [];
        oParametrizacion.value._method = "POST";
    };

    onMounted(() => {});

    return {
        oParametrizacion,
        setParametrizacion,
        limpiarParametrizacion,
    };
};
