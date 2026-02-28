<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ParametrizacionStoreRequest extends FormRequest
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
            "campo" => "required",
            "valor" => "required",
        ];
    }

    /**
     * Mensajes validacion
     *
     * @return void
     */
    public function messages(): array
    {
        return [];
    }
}
