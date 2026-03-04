<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProduccionUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "producto_id" => "required",
            "fecha_inicio" => "required|date",
            "descripcion" => "nullable",
        ];
    }

    public function messages()
    {
        return [
            "producto.required" => "Debes seleccionar un producto",
            "fecha_inicio.required" => "Debes completar este campo",
        ];
    }
}
