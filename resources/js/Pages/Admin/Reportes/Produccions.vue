<script>
const breadbrums = [
    {
        title: "Inicio",
        disabled: false,
        url: route("inicio"),
        name_url: "inicio",
    },
    {
        title: "Reporte Usuarios",
        disabled: false,
        url: "",
        name_url: "",
    },
];
</script>

<script setup>
import { useApp } from "@/composables/useApp";
import { computed, onMounted, ref } from "vue";
import { Head, usePage } from "@inertiajs/vue3";

const { setLoading } = useApp();

const cargarListas = () => {};

const listProduccions = ref([]);

onMounted(() => {
    cargarListas();
    getProduccions();
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const form = ref({
    produccion_id: "todos",
    estado: "todos",
    fecha_ini: "",
    fecha_fin: "",
});

const listEstados = ref([
    {
        id: "todos",
        label: "TODOS",
    },
    {
        id: "INICIADO",
        label: "INICIADO",
    },
    {
        id: "EN PROCESO",
        label: "EN PROCESO",
    },
    {
        id: "FINALIZADO",
        label: "FINALIZADO",
    },
]);

const generando = ref(false);
const txtBtn = computed(() => {
    if (generando.value) {
        return "Generando Reporte...";
    }
    return "Generar Reporte";
});

const generarReporte = () => {
    generando.value = true;
    const url = route("reportes.r_produccions", form.value);
    window.open(url, "_blank");
    setTimeout(() => {
        generando.value = false;
    }, 500);
};

const getProduccions = () => {
    axios.get(route("produccions.listado")).then((response) => {
        listProduccions.value = response.data.produccions;
        listProduccions.value.unshift({
            ...{ id: "todos", label: "TODOS", nombre: "TODOS" },
        });
    });
};
</script>
<template>
    <Head title="Reporte Lista de Producción de Productos"></Head>
    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item active">
            Reportes > Lista de Producción de Productos
        </li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Reportes > Lista de Producción de Productos</h1>
    <!-- END page-header -->
    <div class="row">
        <div class="col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <form @submit.prevent="generarReporte">
                        <div class="row">
                            <div class="col-md-12">
                                <label>Código de Producción*</label>
                                <el-select v-model="form.produccion_id">
                                    <el-option
                                        v-for="item in listProduccions"
                                        :value="item.id"
                                        :key="item.id"
                                        :label="
                                            item.nombre ??
                                            `${item.id} - ${item.producto.nombre}`
                                        "
                                    >
                                    </el-option>
                                </el-select>
                            </div>
                            <div class="col-md-12">
                                <label>Estado</label>
                                <el-select v-model="form.estado">
                                    <el-option
                                        v-for="item in listEstados"
                                        :value="item.id"
                                        :key="item.id"
                                        :label="item.label"
                                    >
                                    </el-option>
                                </el-select>
                            </div>
                            <div class="col-md-12 mt-2">
                                <label>Rango de fechas</label>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input
                                            type="date"
                                            class="form-control"
                                            v-model="form.fecha_ini"
                                        />
                                    </div>
                                    <div class="col-md-6">
                                        <input
                                            type="date"
                                            class="form-control"
                                            v-model="form.fecha_fin"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 text-center mt-3">
                                <button
                                    class="btn btn-primary"
                                    block
                                    @click="generarReporte"
                                    :disabled="generando"
                                    v-text="txtBtn"
                                ></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>
