Admin

<form action="<?=site_url('admin/create_user') ?>" method="post">
	Email: <input type="email" name="email" />
	Password: <input type="password" name="password" />
	<input type="submit" />
</form>

<table>
<thead>
	<th>ID</th>
	<th>Email</th>
	<th>Options</th>
</thead>
<tbody>
<?php foreach($users as $_key => $_value): ?>
<tr>
	<td><?=$_value->user_id ?></td>
	<td><?=$_value->email ?></td>
	<td><a href="#">Delete</a></td>
</tr>
<?php endforeach; ?>
</tbody>
</table>