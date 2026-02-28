<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { useParametrizacions } from "@/composables/parametrizacions/useParametrizacions";
import { useAxios } from "@/composables/axios/useAxios";
import { initDataTable } from "@/composables/datatable.js";
import { ref, onMounted, onBeforeUnmount } from "vue";
// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
// import { useMenu } from "@/composables/useMenu";
// const { mobile, identificaDispositivo } = useMenu();
const { props: props_page } = usePage();
const { setLoading } = useApp();
onMounted(() => {
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const { setParametrizacion, limpiarParametrizacion, oParametrizacion } =
    useParametrizacions();
const { axiosDelete } = useAxios();

const parametrizacion = ref(oParametrizacion.value);
const oProducto = ref(null);
const listProductos = ref([]);
const getProductos = async () => {
    await axios.get(route("productos.listado")).then((response) => {
        listProductos.value = response.data.productos;
    });
};

const getParametrizacionProducto = (value) => {
    axios
        .get(route("parametrizacions.parametrizacionProducto"), {
            params: {
                producto_id: value,
            },
        })
        .then((response) => {
            oProducto.value = response.data.producto;
            parametrizacion.value.producto_id = oProducto.value.id;
            parametrizacion.value.parametrizacions =
                response.data.parametrizacions;
            toast.success(
                `Parametrización cargada correctamente para el producto ${oProducto.value.nombre}`,
            );
        })
        .catch(() => {
            toast.error(`Error al cargar la parametrización del producto`);
        });
};

const debounceTimers = {};

const updateParametrizacion = (event, campo, id) => {
    const value = event.target.value;
    const key = `${id}-${campo}`; // clave única por campo

    // Limpiar timer anterior si existe
    if (debounceTimers[key]) {
        clearTimeout(debounceTimers[key]);
    }

    // Crear nuevo timer
    debounceTimers[key] = setTimeout(() => {
        const index = parametrizacion.value.parametrizacions.findIndex(
            (p) => p.id === id,
        );

        if (index !== -1) {
            axios
                .put(route("parametrizacions.update", id), {
                    campo: campo,
                    valor: value,
                })
                .then(() => {
                    parametrizacion.value.parametrizacions[index][campo] =
                        value;
                    toast.success(`Parametrización actualizada correctamente`);
                })
                .catch(() => {
                    toast.error(`Error al actualizar la parametrización`);
                });
        }
    }, 500); // 500ms debounce
};

onMounted(async () => {
    limpiarParametrizacion();
    getProductos();
});
onBeforeUnmount(() => {});
</script>
<template>
    <Head title="Parametrización"></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">Parametrización</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Parametrización</h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <div class="row">
                        <div class="col-12">
                            <label for="">Seleccionar Producto:</label>
                            <el-select
                                v-model="parametrizacion.producto_id"
                                filterable
                                placeholder="Seleccionar Producto"
                                no-data-text="No se encontraron resultados"
                                no-match-text="No se encontraron resultados"
                                @change="getParametrizacionProducto"
                            >
                                <el-option
                                    v-for="item in listProductos"
                                    :key="item.id"
                                    :value="item.id"
                                    :label="item.nombre"
                                >
                                </el-option>
                            </el-select>
                        </div>
                        <div class="col-12 mt-2">
                            <table class="table table-bordered">
                                <thead class="bg-primary">
                                    <tr>
                                        <th class="text-white" rowspan="2">
                                            PROCESO
                                        </th>
                                        <th class="text-white" colspan="2">
                                            CALIDAD MALA
                                        </th>
                                        <th class="text-white" colspan="2">
                                            CALIDAD BAJA
                                        </th>
                                        <th class="text-white" colspan="2">
                                            CALIDAD ACEPTABLE
                                        </th>
                                        <th class="text-white" colspan="2">
                                            CALIDAD ÓPTIMA
                                        </th>
                                    </tr>
                                    <tr>
                                        <th class="text-sm text-white">
                                            TIEMPO
                                        </th>
                                        <th class="text-sm text-white">
                                            CALIDAD
                                        </th>
                                        <th class="text-sm text-white">
                                            TIEMPO
                                        </th>
                                        <th class="text-sm text-white">
                                            CALIDAD
                                        </th>
                                        <th class="text-sm text-white">
                                            TIEMPO
                                        </th>
                                        <th class="text-sm text-white">
                                            CALIDAD
                                        </th>
                                        <th class="text-sm text-white">
                                            TIEMPO
                                        </th>
                                        <th class="text-sm text-white">
                                            CALIDAD
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="body_parametrizacions">
                                    <template
                                        v-if="
                                            parametrizacion.parametrizacions
                                                .length > 0
                                        "
                                    >
                                        <tr
                                            v-for="p in parametrizacion.parametrizacions"
                                            :key="p.id"
                                        >
                                            <td
                                                class="bg-primary text-white"
                                                v-html="p.texto"
                                            ></td>
                                            <td class="p-0">
                                                <input
                                                    type="number"
                                                    min="0"
                                                    class="form-control rounded-0 w-100"
                                                    v-model="p.cm_horas"
                                                    @keyup="
                                                        updateParametrizacion(
                                                            $event,
                                                            'cm_horas',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateParametrizacion(
                                                            $event,
                                                            'cm_horas',
                                                            p.id,
                                                        )
                                                    "
                                                />
                                                Horas
                                            </td>
                                            <td class="p-0">
                                                <input
                                                    type="number"
                                                    min="0"
                                                    max="100"
                                                    class="form-control rounded-0 w-100"
                                                    v-model="p.cm_calidad"
                                                    @keyup="
                                                        updateParametrizacion(
                                                            $event,
                                                            'cm_calidad',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateParametrizacion(
                                                            $event,
                                                            'cm_calidad',
                                                            p.id,
                                                        )
                                                    "
                                                />%
                                            </td>
                                            <td class="p-0">
                                                <input
                                                    type="number"
                                                    min="0"
                                                    class="form-control rounded-0 w-100"
                                                    v-model="p.cb_horas"
                                                    @keyup="
                                                        updateParametrizacion(
                                                            $event,
                                                            'cb_horas',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateParametrizacion(
                                                            $event,
                                                            'cb_horas',
                                                            p.id,
                                                        )
                                                    "
                                                />Horas
                                            </td>
                                            <td class="p-0">
                                                <input
                                                    type="number"
                                                    min="0"
                                                    max="100"
                                                    class="form-control rounded-0 w-100"
                                                    v-model="p.cb_calidad"
                                                    @keyup="
                                                        updateParametrizacion(
                                                            $event,
                                                            'cb_calidad',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateParametrizacion(
                                                            $event,
                                                            'cb_calidad',
                                                            p.id,
                                                        )
                                                    "
                                                />%
                                            </td>
                                            <td class="p-0">
                                                <input
                                                    type="number"
                                                    min="0"
                                                    class="form-control rounded-0 w-100"
                                                    v-model="p.ca_horas"
                                                    @keyup="
                                                        updateParametrizacion(
                                                            $event,
                                                            'ca_horas',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateParametrizacion(
                                                            $event,
                                                            'ca_horas',
                                                            p.id,
                                                        )
                                                    "
                                                />Horas
                                            </td>
                                            <td class="p-0">
                                                <input
                                                    type="number"
                                                    min="0"
                                                    max="100"
                                                    class="form-control rounded-0 w-100"
                                                    v-model="p.ca_calidad"
                                                    @keyup="
                                                        updateParametrizacion(
                                                            $event,
                                                            'ca_calidad',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateParametrizacion(
                                                            $event,
                                                            'ca_calidad',
                                                            p.id,
                                                        )
                                                    "
                                                />%
                                            </td>
                                            <td class="p-0">
                                                <input
                                                    type="number"
                                                    min="0"
                                                    class="form-control rounded-0 w-100"
                                                    v-model="p.co_horas"
                                                    @keyup="
                                                        updateParametrizacion(
                                                            $event,
                                                            'co_horas',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateParametrizacion(
                                                            $event,
                                                            'co_horas',
                                                            p.id,
                                                        )
                                                    "
                                                />Horas
                                            </td>
                                            <td class="p-0">
                                                <input
                                                    type="number"
                                                    min="0"
                                                    max="100"
                                                    class="form-control rounded-0 w-100"
                                                    v-model="p.co_calidad"
                                                    @keyup="
                                                        updateParametrizacion(
                                                            $event,
                                                            'co_calidad',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateParametrizacion(
                                                            $event,
                                                            'co_calidad',
                                                            p.id,
                                                        )
                                                    "
                                                />%
                                            </td>
                                        </tr>
                                    </template>
                                    <template v-else>
                                        <tr>
                                            <td colspan="5" class="text-center">
                                                No se encontraron resultados
                                            </td>
                                        </tr>
                                    </template>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- END panel-body -->
            </div>
            <!-- END panel -->
        </div>
    </div>
</template>
<style scoped>
.body_parametrizacions tr td,
.body_parametrizacions tr td input {
    vertical-align: middle;
    text-align: center;
}
</style>
