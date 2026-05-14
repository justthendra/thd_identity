let selectedGender = 0; // 0: Erkek, 1: Kadın

window.addEventListener('message', function (event) {
    if (event.data.type === "open_identity") {
        $("#identity-container").fadeIn(300);
    }
});

// Cinsiyet Seçimi
function selectGender(element) {
    $(".gender-option").removeClass("active");
    $(element).addClass("active");
    selectedGender = $(element).data("value");
}

// Form Gönderimi
$("#register-form").submit(function (e) {
    e.preventDefault();

    let firstname = $("#firstname").val();
    let lastname = $("#lastname").val();
    let birthdate = $("#birthdate").val();
    let nationality = $("#nationality").val();

    // Basit doğrulama
    if (!firstname || !lastname || !birthdate || !nationality) {
        return; // HTML required attribute'u zaten uyarı verir
    }

    // Tarih formatını QBCore'un istediği şekle (YYYY-MM-DD) zaten input type="date" veriyor.
    // Ancak QBCore bazen DD-MM-YYYY isteyebilir, standart olarak YYYY-MM-DD gönderip serverda işleyebiliriz.

    $.post('https://thd_identity/register', JSON.stringify({
        firstname: firstname,
        lastname: lastname,
        birthdate: birthdate,
        nationality: nationality,
        gender: selectedGender
    }));

    $("#identity-container").fadeOut(300);
});