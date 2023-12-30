<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"
    ></script>
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css"
    />
</head>
<body>
<div class="position-relative justify-content-center" style="padding: 10% 0">
    <div class="border border-3 border-warning-subtle rounded-4 p-5 w-50 mx-auto">
        <h1 class="display-3 text-center mb-3 bg-warning mx-auto" style="border-radius: 100%; width: 17%">
            <i class="bi bi-exclamation-lg"></i>
        </h1>
        <h1 class="display-1 text-center mb-3">Login Error!</h1>
        <p class="fs-4 text-center mb-5">
            Check if your credentials are correct and try again
        </p>

        <div class="row p-0 gap-4">
            <div class="col p-0">
                <a href="index.jsp">
                    <button class="btn btn-success align-end mx-auto w-100">
                        <h3 class="fs-3 text-center fw-semibold">To Homepage</h3>
                    </button>
                </a>
            </div>
            <div class="col p-0">
                <a href="login.jsp">
                    <button class="btn btn-warning mx-auto w-100">
                        <h3 class="fs-3 text-center fw-semibold">Try again</h3>
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
