<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{{ config('app.name', 'Laravel') }}</title>
        <link href="https://cdn.jsdelivr.net/npm/remixicon/fonts/remixicon.css" rel="stylesheet">
        @vite('resources/css/app.css')
    </head>
    <body class="bg-slate-900 text-gray-400" style="background-image: url('{{ asset('images/background.webp') }}')">
        <div class="w-[90%] max-w-7xl mx-auto mt-16 p-10 bg-black/30 rounded-xl">
            <h1 class="text-3xl mb-5">Laravel-Demo für DevOps-Showcase</h1>
            <p class="mb-3">Die Seite, die Sie hier aufgerufen haben, dient nur dem Zweck eine realistische Umgebung für DevOps darzustellen.</p>
            <p class="mb-3">Die Seite ist bewusst schlank gehalten, ohne weitere Logik und sogar ohne Datenbank. Der Fokus liegt hier auf Docker, Pipelines und Artefakten.</p>
            <p class="mb-3">In diesem Fall werden GitHub Actions benutzt, aber das könnte ich genauso auch auf GitLab, mit CI/CD umsetzen.</p>
            <p class="mb-3">In einem weiteren <a href="https://github.com/nbiuk-devops-lab/infrastructure" target="_blank" class="text-blue-500">Repository</a>, in der gleichen <a href="https://github.com/nbiuk-devops-lab/" target="_blank" class="text-blue-500">GitHub Organisation</a>, geht es vor allem um Themen wie Clound Infrastuktur (IaC, Terraform) und Kubernetes.</p>
            <br>
            <p class="mb-1">
                Machen Sie sich ein Bild auf meiner
            </p>
            <a href="https://nbiuk.github.io/profile" target="_blank" class="text-blue-500"><i class="ri-github-fill text-2xl  "></i> GitHub Seite</a>
        </div>
    </body>
</html>
