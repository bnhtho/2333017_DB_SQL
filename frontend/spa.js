$(document).ready(function () {
  // Các hàm tải trang
  function loadPage(url) {
    $.ajax({
      url: url,
      method: 'GET',
      success: function (data) {
        $('#content').html(data);
        registerEvents();
      }
    });
  }

  // Hàm đăng ký lại các sự kiện
  function registerEvents() {
    $('#loadEmployeeList').on('click', function (e) {
      e.preventDefault();
      window.location.hash = 'employeeList'; // Thay đổi hash
      loadPage('employee_list.html');
    });

    $('#backToInsertEmployeePage').on('click', function (e) {
      e.preventDefault();
      window.location.hash = 'insertEmployee'; // Thay đổi hash
      loadPage('insert_employee.html');
    });

    $('#productLink').on('click', function (e) {
      e.preventDefault();
      window.location.hash = 'product'; // Thay đổi hash
      loadPage('product.html');
    });

    $('#loadCommentsPage').on('click', function (e) {
      e.preventDefault();
      window.location.hash = 'comments'; // Thay đổi hash
      loadPage('comment.html');
    });

    $('#loadhotProduct').on('click', function (e) {
      e.preventDefault();
      window.location.hash = 'hotProduct'; // Thay đổi hash
      loadPage('trending_products.html');
    });
  }

  // Xử lý hash để tải trang phù hợp
  function loadInitialPage() {
    const hash = window.location.hash.substring(1); // Bỏ dấu #
    switch (hash) {
      case 'employeeList':
        loadPage('employee_list.html');
        break;
      case 'product':
        loadPage('product.html');
        break;
      case 'comments':
        loadPage('comment.html');
        break;
      case 'hotProduct':
        loadPage('trending_products.html');
        break;
      case 'insertEmployee':
      default:
        loadPage('insert_employee.html');
        break;
    }
  }

  // Gọi hàm khi bắt đầu
  loadInitialPage();
});
