$(document).ready(function() {
  // Hàm tải trang nhân viên (insert_employee.html)
  function loadInsertEmployeePage() {
    $.ajax({
      url: 'insert_employee.html',  // Tải trang nhân viên
      method: 'GET',
      success: function(data) {
        $('#content').html(data);  // Chèn nội dung vào #content
        registerEvents();  // Đăng ký lại sự kiện sau khi tải nội dung
      }
    });
  }
  function loadCommentList() {
    $.ajax({
      url: 'comment.html',  // Tải trang nhân viên
      method: 'GET',
      success: function(data) {
        $('#content').html(data);  // Chèn nội dung vào #content
        registerEvents();  // Đăng ký lại sự kiện sau khi tải nội dung
      }
    });
  }
  // Hàm tải trang danh sách nhân viên (employee_list.html)
  function loadEmployeeList() {
    $.ajax({
      url: 'employee_list.html',  // Tải trang danh sách nhân viên
      method: 'GET',
      success: function(data) {
        $('#content').html(data);  // Chèn nội dung vào #content
        registerEvents();  // Đăng ký lại sự kiện sau khi tải nội dung
      }
    });
  }


  function loadproductLink() {
    $.ajax({
      url: 'product.html',  // Tải trang danh sách sản phẩm
      method: 'GET',
      success: function(data) {
        $('#content').html(data);  // Chèn nội dung vào #content
        registerEvents();  // Đăng ký lại sự kiện sau khi tải nội dung
      }
    });
  }

  // Hàm đăng ký lại các sự kiện (sự kiện cho các liên kết)
  function registerEvents() {
    // Sự kiện nhấn vào "Nhấn vào đây để xem danh sách nhân viên"
    $('#loadEmployeeList').on('click', function(e) {
      e.preventDefault();  // Ngừng hành động mặc định
      loadEmployeeList();  // Tải danh sách nhân viên
    });

    // Sự kiện quay lại trang nhập nhân viên
    $('#backToInsertEmployeePage').on('click', function(e) {
      e.preventDefault();
      loadInsertEmployeePage();  // Tải lại trang nhập nhân viên
    });
    // Load danh sách sản phẩm
    $('#productLink').on('click', function(e) {
      e.preventDefault();
      loadproductLink();  // Tải lại trang nhập nhân viên
    });
    // Load danh sách đánh giá
    $('#loadCommentsPage').on('click',function(e){
      e.preventDefault();
      loadCommentList(); // Tải trang load bình luận
    })
  }
  loadInsertEmployeePage();  // Tải trang nhân viên khi bắt đầu

});