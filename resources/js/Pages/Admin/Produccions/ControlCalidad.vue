<script setup>
import { useApp } from "@/composables/useApp";
import { Head, Link, router, usePage } from "@inertiajs/vue3";
import { useProduccions } from "@/composables/produccions/useProduccions";
import { useAxios } from "@/composables/axios/useAxios";
import { ref, onMounted, onBeforeUnmount } from "vue";
// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
const props = defineProps({
    produccion: Object,
});
const { props: props_page } = usePage();
const { setLoading } = useApp();
onMounted(() => {
    setTimeout(() => {
        setLoading(false);
    }, 300);
});

const { setProduccion, limpiarProduccion } = useProduccions();
const { axiosDelete } = useAxios();
const debounceTimers = {};

const updateControlCalidad = (event, campo, id) => {
    const value = event.target.value;
    const key = `${id}-${campo}`; // clave única por campo

    // Limpiar timer anterior si existe
    if (debounceTimers[key]) {
        clearTimeout(debounceTimers[key]);
    }

    // Crear nuevo timer
    debounceTimers[key] = setTimeout(() => {
        const index = props.produccion.control_calidads.findIndex(
            (p) => p.id === id,
        );

        if (index !== -1) {
            axios
                .put(route("produccions.updateControlCalidad", id), {
                    campo: campo,
                    valor: value,
                })
                .then(() => {
                    props.produccion.control_calidads[index][campo] = value;
                    toast.success(
                        `Control de Calidad actualizado correctamente`,
                    );
                })
                .catch(() => {
                    toast.error(`Error al actualizar el control de calidad`);
                });
        }
    }, 500); // 500ms debounce
};

onMounted(async () => {});
onBeforeUnmount(() => {});
</script>
<template>
    <Head title="Producción"></Head>

    <!-- BEGIN breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="javascript:;">Inicio</a></li>
        <li class="breadcrumb-item">
            <Link :href="route('produccions.index')">Producción</Link>
        </li>
        <li class="breadcrumb-item active">Control de Calidad</li>
    </ol>
    <!-- END breadcrumb -->
    <!-- BEGIN page-header -->
    <h1 class="page-header">Control de Calidad</h1>
    <!-- END page-header -->

    <div class="row">
        <div class="col-md-12">
            <!-- BEGIN panel -->
            <div class="panel panel-inverse">
                <!-- BEGIN panel-body -->
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4">
                            <Link
                                :href="route('produccions.index')"
                                class="btn btn-default"
                            >
                                <i class="fa fa-arrow-left"></i> Volver
                            </Link>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <p>
                                <strong>Código: </strong>
                                {{ produccion.id }}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p>
                                <strong>Producto: </strong>
                                {{ produccion.producto.nombre }}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p>
                                <strong>Fecha Inicio Producción: </strong>
                                {{ produccion.fecha_inicio_t }}
                            </p>
                        </div>
                        <div class="col-md-6">
                            <p>
                                <strong>Descripción: </strong>
                                {{ produccion.descripcion }}
                            </p>
                        </div>
                        <div class="col-12 mt-2 col-lg-8 offset-lg-2">
                            <table class="table table-bordered">
                                <thead class="bg-primary">
                                    <tr>
                                        <th class="text-white" rowspan="2">
                                            PROCESO
                                        </th>
                                        <th
                                            class="text-white text-center"
                                            colspan="2"
                                        >
                                            CALIDAD DE PRODUCCIÓN
                                        </th>
                                    </tr>
                                    <tr>
                                        <th
                                            class="text-sm text-white text-center"
                                        >
                                            TIEMPO
                                        </th>
                                        <th
                                            class="text-sm text-white text-center"
                                        >
                                            CALIDAD
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="body_control_calidads">
                                    <template
                                        v-if="
                                            produccion.control_calidads.length >
                                            0
                                        "
                                    >
                                        <tr
                                            v-for="p in produccion.control_calidads"
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
                                                    v-model="p.tiempo"
                                                    @keyup="
                                                        updateControlCalidad(
                                                            $event,
                                                            'tiempo',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateControlCalidad(
                                                            $event,
                                                            'tiempo',
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
                                                    v-model="p.calidad"
                                                    @keyup="
                                                        updateControlCalidad(
                                                            $event,
                                                            'calidad',
                                                            p.id,
                                                        )
                                                    "
                                                    @change="
                                                        updateControlCalidad(
                                                            $event,
                                                            'calidad',
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
