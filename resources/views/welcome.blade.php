<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ config('app.name', 'Laravel') }}</title>
        @vite('resources/css/app.css')
    </head>
    <body class="bg-slate-900 text-white" style="background-image: url('{{ asset('images/background.webp') }}')">
        <p class="text-4xl">
            Hello Tailwind 🚀
        </p>
    </body>
</html>
