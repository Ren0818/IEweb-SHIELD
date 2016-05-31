<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master"
    AutoEventWireup="true" CodeFile="map.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <div class="navbar navbar-inverse navbar-fixed-top headroom">
        <div class="container">
            <div class="navbar-header">
                <!-- Button for smallest screens -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.aspx">
                    <img src="assets/images/logo.png" alt=""></img>
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav pull-right">
                    <li>
                        <a href="index.aspx">Home</a>
                    </li>
                    <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="search.aspx">Search</a>
                            </li>
                            <li>
                                <a href="top10.aspx">Top 10</a>
                            </li>
                            <li class="active">
                                <a href="Map.aspx">Map</a>
                            </li>
                            <li>
                                <a href="compare.aspx">Compare</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="forum.aspx">Discuss</a>
                    </li>
                    <li>
                        <a href="ourHis.aspx" class="dropdown active">About Us</a>
                    </li>
                    <li>
                        <a href="Contact.aspx">Contact</a>
                    </li>
                    <li>
                        <a href="<%=URL%>">
                            <asp:Label runat="server" id="UserSigned" Text="SIGN IN / SIGN UP" class="btn-sm btn-info"></asp:Label>

                        </a>
                    </li>
                    <li>
                        <a href="<%=URL1%>">
                            <asp:Label runat="server" id="user" class="btn-sm btn-success" Visible="False" />

                        </a>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="assets/js/headroom.min.js"></script>
    <script src="assets/js/jQuery.headroom.min.js"></script>
    <script src="assets/js/template.js"></script>
    <script src="assets/js/bootstrap.js" type="text/javascript"></script>

    <header id="head" class="secondary"></header>
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">Map </li>
        </ol>
        <br/><br/><br/><hr>
        <div class="container">
         
        </div> <h3 class="thin text-center">Map</h3>
                                           <p class="text-center text-muted" >You can enter the postcode or name to find the location, and also can click the buttons on the right side to find the nearby hospitals and police stations</p><hr>
        <div class="col-md-9">
           
            <div class="col-md-6">
                <input id="pac-input" type="text" placeholder="Search Box" class="form-control" style="width: 30%" onkeypress="return noenter(event)">
            </div>
            <div class="col-md-6">
            </div>
        </div>

        <div class="col-md-12" onload="initMap() ">

            <div class="col-md-9">
                <div id="map" style="height: 600px;">
                </div>
            </div>
            <div class="col-md-3">
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="hospital" runat="server" ImageUrl="~/assets/images/hospital-icon.png" /></td>
                        <td>
                            <input type="button" name="btn" value="Hospital" class="form-control btn-success" onclick="marker1()" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="policestation" runat="server" ImageUrl="~/assets/images/police-icon.png" /></td>
                        <td>
                            <input type="button" name="btn" value="Police station" class="form-control btn-success" onclick="marker()" /></td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                       <td>
                         <td><input type="button" name="btn" value="Clear Map" class="form-control btn-success" onclick="deleteMarkers()" /></td>
                    </tr>
                </table>
                <p>
                    
                </p>
            </div>

        </div>




    <script type="text/javascript">
        function noenter(e) {
            e = e || window.event;
            var key = e.keyCode || e.charCode;
            return key !== 13;
        }
        var hoslat = new Array();
        var hoslng = new Array();
        var map;
        var markers = [];
        var geocoder = new google.maps.Geocoder();
        function list() {
            var ddl = document.getElementById("factors");
            if (ddl) {
                var text = ddl.options[ddl.selectedIndex].innerHTML;
                var value = ddl.options[ddl.selectedIndex].value;
            }
            return value;
        }


        function initMap() {
            var loc = { lat: -37, lng: 144 };

            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 7,
                center: loc,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                showOnLoad: true
            });
            // This event listener will call addMarker() when the map is clicked.
            map.addListener('click', function (event) {
                addMarker(event.latLng);
            });
            // Create the search box and link it to the UI element.
            var input = document.getElementById('pac-input');
            var searchBox = new google.maps.places.SearchBox(input);
            map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

            // Bias the SearchBox results towards current map's viewport.
            map.addListener('bounds_changed', function () {
                searchBox.setBounds(map.getBounds());
            });

            // [START region_getplaces]
            // Listen for the event fired when the user selects a prediction and retrieve
            // more details for that place.
            searchBox.addListener('places_changed', function () {
                var places = searchBox.getPlaces();

                if (places.length == 0) {
                    return;
                }



                // For each place, get the icon, name and location.
                var bounds = new google.maps.LatLngBounds();
                places.forEach(function (place) {
                    var icon = {
                        url: place.icon,
                        size: new google.maps.Size(71, 71),
                        origin: new google.maps.Point(0, 0),
                        anchor: new google.maps.Point(17, 34),
                        scaledSize: new google.maps.Size(25, 25)
                    };

                    // Create a marker for each place.
                    markers.push(new google.maps.Marker({
                        map: map,
                        icon: icon,
                        title: place.name,
                        position: place.geometry.location
                    }));

                    if (place.geometry.viewport) {
                        // Only geocodes have viewport.
                        bounds.union(place.geometry.viewport);
                    } else {
                        bounds.extend(place.geometry.location);
                    }
                });
                map.fitBounds(bounds);
            });
            // [END region_getplaces]

        }
        function list() {
            var ddl = document.getElementById("factors");
            if (ddl) {
                var text = ddl.options[ddl.selectedIndex].innerHTML;
                var value = ddl.options[ddl.selectedIndex].value;
            }
            return value;
        }

        function marker() {
            clearMarkers();
            {
                var la = new Array();
                var ln = new Array();
                <% for (int i = 0; i < la.Length; i++)
                   { %>
                la.push(<%=la[i]%>);
                ln.push(<%=ln[i]%>);
                <% }%>
                var pic = "assets/images/police-icon.png";
                for (var i = 0; i < la.length; i++) {
                    var myLatLng = { lat: la[i], lng: ln[i] }
                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        icon: pic,
                        title: 'Police Station'
                    });
                    markers.push(marker);

                }
            }
        }
        function marker1() {
            clearMarkers();
            {
                var la = new Array();
                var ln = new Array();
                <% for (int i = 0; i < hosla.Length; i++)
                   { %>
                la.push(<%=hosla[i]%>);
                ln.push(<%=hosln[i]%>);
                <% }%>
                var pic = "assets/images/hospital-icon.png";
                for (var i = 0; i < la.length; i++) {
                    var myLatLng = { lat: la[i], lng: ln[i] }
                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        icon: pic,
                        title: 'Hospital'
                    });
                    markers.push(marker);

                }
            }


        }



        function addMarker(location) {
            var marker = new google.maps.Marker({
                position: location,
                map: map
            });
            markers.push(marker);
        }

        // Sets the map on all markers in the array.
        function setMapOnAll(map) {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(map);
            }
        }

        // Removes the markers from the map, but keeps them in the array.
        function clearMarkers() {
            setMapOnAll(null);
        }

        // Shows any markers currently in the array.
        function showMarkers() {
            setMapOnAll(map);
        }

        // Deletes all markers in the array by removing references to them.
        function deleteMarkers() {
            clearMarkers();
            markers = [];
        }


    </script>

    <script src="https://maps.googleapis.com/maps/api/js?libraries=places&callback=initMap"
        async defer></script>
</asp:Content>

