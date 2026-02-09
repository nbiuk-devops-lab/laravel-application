<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ config('app.name', 'Laravel') }}</title>
        @vite('resources/css/app.css')
    </head>
    <body class="bg-slate-900 text-white" style="background-image: url('{{ asset('images/background.webp') }}')">
        <div class="w-[90%] max-w-7xl mx-auto mt-16 p-10 bg-black/60 rounded-xl">
            <h1 class="text-4xl">
                Demo-Seite
            </h1>
            <p>Diese Seite </p>
        </div>
    </body>
</html>
