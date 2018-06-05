<?php /*a:1:{s:56:"E:\kyweixin\EasyAdmin\cqkyicms\admin\view\role\edit.html";i:1525919784;}*/ ?>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title"><?php echo htmlentities($name); ?></h4>
        </div>
        <form id="Add" method="post" action="<?php echo url('role/edit',['id' => $vo['role_id']]); ?>" target="frame">
        <div class="modal-body">


            <div class="row">
                <div class="col-md-12">

                        <div class="form-group">
                            <label for="role_name" class="control-label">角色名称</label>
                            <input type="text" class="form-control" id="role_name" name="role_name" value="<?php echo htmlentities($vo['role_name']); ?>" placeholder="菜单名称">
                            <input id="all_rules" name="all_rules" type="hidden" class="form-control" value="<?php echo htmlentities($vo['rules']); ?>">
                            <input type="hidden" name="__token__" value="<?php echo htmlentities(app('request')->token()); ?>" />
                        </div>


                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label  for="all_rules" class="control-label">角色权限</label>
                        <div id="menuTree"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label  class="control-label">备注</label>

                           <textarea class="form-control"></textarea>

                    </div>
                </div>


            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label  class="control-label">排序</label>


                            <input type="text"  name="orderby" class="form-control" placeholder="排序">


                    </div>
                </div>


            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">关闭</button>
            <button type="button" id="menuAdd" class="btn btn-info waves-effect waves-light">保存</button>
        </div>
        </form>
    </div>
</div>
<script src="/static/admins/js/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="/static/admins/js/layer/layer.js"></script>
<script src="/static/admins/js/jsTree/jstree.min.js"></script>
<link href="/static/admins/js/jsTree/style.min.css" rel="stylesheet" type="text/css">
<script>


    $('#menuAdd').click(function () {
 getAllSelectNodes();
        $('#all_rules').val(all_rules);

       $('#Add').submit();
});

    getMenuTreeData();
    function getMenuTreeData() {
        $.ajax({
            type : "GET",
            url : "<?php echo url('menu/edittree',['id' => $vo['role_id']]); ?>",
            success : function(menuTree) {
                loadMenuTree(menuTree);
            }
        });
    }

    function loadMenuTree(menuTree) {

        var tree = '['+menuTree+']';
        var treeshow = eval(tree);
        console.log(eval( tree ));
        $('#menuTree').jstree({
            'core' : {
                'data' :treeshow
            },
            "checkbox" : {
                "three_state" : true,
            },
            "plugins" : [ "wholerow", "checkbox" ]
        });


    }
    function getAllSelectNodes() {
        var ref = $('#menuTree').jstree(true); // 获得整个树

        all_rules = ref.get_selected(); // 获得所有选中节点的，返回值为数组

        $("#menuTree").find(".jstree-undetermined").each(function(i, element) {
            all_rules.push($(element).closest('.jstree-node').attr("id"));
        });
        $('#all_rules').val(all_rules);

    }

</script>