--Query 1

select * from "Track" where "Composer" is null;

--Query 2

select * from "Track" where "Composer" is not null;

--Query 3

select p."Name" from "Playlist" p inner join "PlaylistTrack" pt on p."PlaylistId" = pt."PlaylistId" 
inner join "Track" t on t."TrackId" = pt."TrackId" where t."Composer" = 'AC/DC';

--Query 4

select distinct p."Name" from "Playlist" p inner join "PlaylistTrack" pt on p."PlaylistId" = pt."PlaylistId" 
inner join "Track" t on t."TrackId" = pt."TrackId" where t."Composer" = 'AC/DC';

--Query 5

select * from "Track" where "UnitPrice" != 0.99;

--Query 6

select * from "Track" where "UnitPrice" = 0.99;

--Query 7

select p."Name", ar."Name", a."Title" from "Playlist" p inner join "PlaylistTrack" pt on p."PlaylistId" = pt."PlaylistId" 
inner join "Track" t on t."TrackId" = pt."TrackId" inner join "Album" a on a."AlbumId" = t."AlbumId" inner join "Artist" ar on ar."ArtistId" = a."ArtistId";

--Query 8

select p."Name", ar."Name", a."Title" from "Playlist" p inner join "PlaylistTrack" pt on p."PlaylistId" = pt."PlaylistId" 
inner join "Track" t on t."TrackId" = pt."TrackId" inner join "Album" a on a."AlbumId" = t."AlbumId" inner join "Artist" ar on ar."ArtistId" = a."ArtistId" where p."Name" = 'Classic';

--Query 9

select p."Name", ar."Name", a."Title" from "Playlist" p inner join "PlaylistTrack" pt on p."PlaylistId" = pt."PlaylistId" 
inner join "Track" t on t."TrackId" = pt."TrackId" inner join "Album" a on a."AlbumId" = t."AlbumId" inner join "Artist" ar on ar."ArtistId" = a."ArtistId" 
where ar."Name" = 'Eric Clapton';

--Query 10

select ar."Name", a."Title" from "Playlist" p inner join "PlaylistTrack" pt on p."PlaylistId" = pt."PlaylistId"
inner join "Track" t on t."TrackId" = pt."TrackId" inner join "Album" a on a."AlbumId" = t."AlbumId" inner join "Artist" ar on ar."ArtistId" = a."ArtistId" 
Group by a."Title", ar."Name";

--Query 11

select p."Name", a."Title" from "Playlist" p inner join "PlaylistTrack" pt on p."PlaylistId" = pt."PlaylistId" 
inner join "Track" t on t."TrackId" = pt."TrackId" inner join "Album" a on a."AlbumId" = t."AlbumId" inner join "Artist" ar on ar."ArtistId" = a."ArtistId" 
where ar."Name" = 'Eric Clapton' order by a."Title" ASC;

--Query 12

select "FirstName", "LastName", "InvoiceId", "InvoiceDate", "BillingAddress"
from "Invoice" i
join "Customer" c on i."CustomerId" = c."CustomerId"
where "BillingCountry" = 'Brazil';

--Query 13

select *
from "Customer"
where "Country" = 'Brazil';

--Query 14

select e."FirstName", e."LastName", sum(i."Total") as TotalSales
from "Employee" e
join "Customer" c on c."SupportRepId" = e."EmployeeId"
join "Invoice" i on c."CustomerId" = i."InvoiceId"
group by e."FirstName", e."LastName";

--Query 15

select "BillingCity", sum("Total") as invoice_totals from "Invoice"
group by 1
order by 2 Desc
limit 1;

--Query 16

select "BillingCity", "Total" from "Invoice"
group by 1, 2
order by 2 Desc
limit 1;

--Query 17

select c."CustomerId",
c."FirstName",
c."LastName",
sum(inv."UnitPrice") as invoices
from "Invoice" i
join "InvoiceLine" inv
on inv."InvoiceId" = i."InvoiceId"
join "Customer" c
on c."CustomerId" = i."CustomerId"
group by c."CustomerId",c."FirstName",c."LastName";

--Query 18

select c."CustomerId",
c."FirstName",
c."LastName",
sum(inv."UnitPrice") as invoices
from "Invoice" i
join "InvoiceLine" inv
on inv."InvoiceId" = i."InvoiceId"
join "Customer" c
on c."CustomerId" = i."CustomerId"
where c."FirstName" = 'Robert'
group by c."CustomerId",c."FirstName",c."LastName";