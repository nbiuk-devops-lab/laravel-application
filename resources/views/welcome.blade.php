<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ config('app.name', 'Laravel') }}</title>
        @vite('resources/css/app.css')
    </head>
    <body class="bg-slate-900 text-white min-h-screen flex items-center justify-center">
        <h1 class="text-4xl font-bold tracking-tight">
            Hello Tailwind 🚀
        </h1>
    </body>
</html>
