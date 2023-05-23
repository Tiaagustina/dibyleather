<?= $this->extend('admin/layout/index'); ?>

<?= $this->section('admin-content'); ?>

<section class="section">
    <div class="section-header">
        <h1>Data Users</h1>
    </div>

    <?= $this->include('admin/layout/alert'); ?>

    <div class="section-body">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="tabelku" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th width="30" class="text-center">No</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Username</th>
                                        <th width="150" class="text-center">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $i = 1;
                                    foreach ($users as $key) : ?>
                                        <tr>
                                            <td align="center"><?= $i++; ?></td>
                                            <td align="center"><?= $key['email']; ?></td>
                                            <td align="center"><?= $key['username']; ?></td>
                                            <td align="center" class="justify-content-around">
                                                <button class="btn-delete btn btn-danger ml-1" type="button" data-title="Hapus User" data-body="#modal-delete-user" data-id="<?= $key['id']; ?>"><i class="fa fa-trash-alt"></i></button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Form hapus data -->
<form class="modal-part" id="modal-delete-user" action="/Admin/Users/delete">
    <?= csrf_field(); ?>
    <p>Apakah anda yakin untuk menghapus user ini?</p>
    <input type="hidden" name="id" id="id">
</form>

<?= $this->endSection(); ?>
<?= $this->section('admin-script'); ?>
<script>
    $(document).on("click", ".btn-delete", function() {
        $(".modal-body #id").val($(this).data("id"));
    });

    // Show Modal Hapus User
    $(".btn-delete").fireModal({
        title: $(".btn-delete").data("title"),
        body: $($(".btn-delete").data("body")),
        footerClass: "bg-whitesmoke",
        buttons: [{
                text: "Cancel",
                closeButton: true,
                class: "btn btn-secondary btn-shadow",
                handler: function(closeModal) {
                    $.destroyModal(closeModal);
                },
            },
            {
                text: "Hapus",
                submit: true,
                class: "btn btn-danger btn-shadow",
                handler: function(modal) {},
            },
        ],
    });
</script>
<?= $this->endSection(); ?>