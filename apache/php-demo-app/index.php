<?php
$conn = pg_connect("host=/var/run/postgresql dbname=appdb user=appuser password=StrongP@ss-ChangeMe");
if (!$conn) { http_response_code(500); echo "DB connect failed"; exit; }
$result = pg_query($conn, "SELECT 'It works! You are logged in via Keycloak.' AS msg");
$row = pg_fetch_assoc($result);
echo "<h1>{$row['msg']}</h1>";
?>
