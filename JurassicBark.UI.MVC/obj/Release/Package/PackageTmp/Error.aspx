<% Response.StatusCode = 404 %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Jurassic Bark</title>
    <link rel="shortcut icon" href="~/Content/favicon.ico" type="image/x-icon">
    <link rel="icon" href="~/Content/favicon.ico" type="image/x-icon">
    <link href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="~/Content/Site.css" rel="stylesheet" />
</head>
<body>
    <h2>Oops!</h2>

    <div class="lead">
        We tried fetching that page, but were distracted by a squirrel.
    </div>

    <div>
        <p>These are the pages that we sniff at the most:</p>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="~/Views/Home/Index.cshtml">Jurassic Bark</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="~/Views/Reservations/Index.cshtml">Reservations</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="~/Views/Pets/Index.cshtml">Pets</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="~/Views/ResortLocations/Index.cshtml">Locations</a>
            </li>
        </ul>
    </div>

</body>
</html>
