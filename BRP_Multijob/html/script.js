var logos = {}

//COFIG START

//CHANGE USING FONTAWSOME (https://fontawesome.com/)
var defaultLogo = 'fas fa-briefcase';
logos['fakepolice'] = 'fas fa-balance-scale-right';
logos['ambulance'] = 'fas fa-briefcase-medical';
logos['fakemechanic'] = 'fas fa-wrench';


//CONFIG END

var job = 'unemployed';
var grade = 3;
var offduty = false;




$(document).keyup(function(e) {
    if (e.keyCode === 27) {

        $.post('https://brp_multijob/close', JSON.stringify({}));
        $("#main_container").fadeOut("slow", function() {

            $("#main_container").html("").fadeIn();
        });

    }


});

function playClickSound() {
    var audio = document.getElementById("audio");
    audio.volume = 0.1;
    audio.play();
}

function openJobCenter() {


var base = '<div id="jobcenter">'+



'<div class="shadow gradient rounded-corners colelem animated fadeInUp" id="u712">'+
'    <div class="clearfix grpelem" id="u465-4"><!-- content -->'+
'      <p>MINER</p>'+
'     </div>'+
'     <button class="rounded-corners grpelem ripple addjob" data-job="miner" id="u468-4"><!-- content -->'+
'      ADD'+
'     </button>'+
'     <div class="grpelem" id="u474"><i class="fas fa-gem fa-3x"></i><!-- simple frame --></div>'+
'     <div class="clearfix grpelem" id="u477-4"><!-- content -->'+
'      <p>Mine rocks and be rock and rollin all of a sudden</p>'+
'     </div>'+
'     </div>'+

'<div class="shadow gradient rounded-corners colelem animated fadeInUp" id="u712">'+
'    <div class="clearfix grpelem" id="u465-4"><!-- content -->'+
'      <p>TRUCKER</p>'+
'     </div>'+
'     <button class="rounded-corners grpelem ripple addjob" data-job="miner" id="u468-4"><!-- content -->'+
'      ADD'+
'     </button>'+
'     <div class="grpelem" id="u474"><i class="fas fa-truck fa-3x"></i><!-- simple frame --></div>'+
'     <div class="clearfix grpelem" id="u477-4"><!-- content -->'+
'      <p>Mine rocks and be rock and rollin all of a sudden</p>'+
'     </div>'+
'     </div>'+

'<div class="shadow gradient rounded-corners colelem animated fadeInUp" id="u712">'+
'    <div class="clearfix grpelem" id="u465-4"><!-- content -->'+
'      <p>FUELER</p>'+
'     </div>'+
'     <button class="rounded-corners grpelem ripple addjob" data-job="miner" id="u468-4"><!-- content -->'+
'      ADD'+
'     </button>'+
'     <div class="grpelem" id="u474"><i class="fas fa-gas-pump fa-3x"></i><!-- simple frame --></div>'+
'     <div class="clearfix grpelem" id="u477-4"><!-- content -->'+
'      <p>Mine rocks and be rock and rollin all of a sudden</p>'+
'     </div>'+
'     </div>'+

'<div class="shadow gradient rounded-corners colelem animated fadeInUp" id="u712">'+
'    <div class="clearfix grpelem" id="u465-4"><!-- content -->'+
'      <p>FISHERMAN</p>'+
'     </div>'+
'     <button class="rounded-corners grpelem ripple addjob" data-job="miner" id="u468-4"><!-- content -->'+
'      ADD'+
'     </button>'+
'     <div class="grpelem" id="u474"><i class="fas fa-fish fa-3x"></i><!-- simple frame --></div>'+
'     <div class="clearfix grpelem" id="u477-4"><!-- content -->'+
'      <p>Mine rocks and be rock and rollin all of a sudden</p>'+
'     </div>'+
'     </div>'+




'   </div>';
  

 $("#main_container").html(base);
}

function openJobManagement() {

    var status = 'SELECT';

    if (job == 'offduty') {
        status = 'SELECTED';
    }




    var base = '<div class="clearfix" id="page"><!-- group -->' +
        '   <div class="clearfix grpelem" id="pu308"><!-- group -->' +
        '    <div class="gradient" id="u308"><!-- simple frame --> <div class="clearfix grpelem" id="pu951" ><!-- column --><div></div>' +
        '    <div id="u311"><!-- simple frame --></div>' +
        '    <div class="clearfix" id="u315-4"><!-- content -->' +
        '     <p>MY JOBS</p>' +
        '    </div>' +
        '    <div class="rgba-background rounded-corners" id="u450"><i class="fas fa-coffee fa-lg" style="margin: 7px; margin-top: 12px;"></i><!-- simple frame --></div>' +
        '    <div class="clearfix" id="u453-4"><!-- content -->' +
        '     <p>OFFDUTY</p>' +
        '    </div>' +
        '    <div id="u459"><!-- simple frame --></div>' +
        '    <button class="rounded-corners ripple select offduty" data-job="offduty" data-grade="0" id="u768-4"><!-- content -->' +
        status +
        '    </button>' +
        '   </div>' +



        '  </div>';




    $("#main_container").html(base);
    $("#page").fadeOut(0);
    $("#page").fadeIn();

}

function addJob(info) {



    var status = 'SELECT';
    var removebutton = '';
    var removable = 'hidden';



    if (info.name == job && grade == info.grade) {

        status = 'SELECTED';
    } else {
        if (info.removable) {
            removable = '';
        }
    }

    if (info.removable) {
        removebutton = '<button class="rounded-corners grpelem ripple removebutton ' + removable + '" data-job="' + info.name + '" data-grade="' + info.grade + '" id="u989"><i class="fas fa-trash-alt fas fa-camera "></i> <!-- simple frame --></button>';
    }

    if (logos[info.name] == null) {
        logos[info.name] = defaultLogo;
    }

    var jobPanel = '    <div class="rgba-background rounded-corners clearfix colelem" id="u981"><!-- column -->' +
        '     <div class="clearfix colelem" id="pu984"><!-- group -->' +
        '      <div class="grpelem" id="u984"><i class=" ' + logos[info.name] + '  fa-lg"></i><!-- simple frame --></div>' +
        '      <div class="clearfix grpelem" id="pu982-4"><!-- column -->' +
        '       <div class="clearfix colelem" id="u982-4"><!-- content -->' +
        '        <p>' + info.label + '</p>' +
        '       </div>' +
        '       <div class="clearfix colelem" id="u983-4"><!-- content -->' +
        '        <p>' + info.grade_label + '</p>' +
        '       </div>' +
        '      </div>' +
        '     </div>' +
        '     <div class="clearfix colelem" id="pu986"><!-- group -->' +
        '      <div class="grpelem" id="u986"><i class="fas fa-money-bill-wave fa-xs"></i><!-- simple frame --></div>' +
        '      <div class="clearfix grpelem" id="u985-4"><!-- content -->' +
        '       <p>$ ' + info.salary + '</p>' +
        '      </div>' +
        removebutton +
        '      <button class="rounded-corners  grpelem ripple select" data-job="' + info.name + '" data-grade="' + info.grade + '" id="u990-4"><!-- content -->' +
        status +
        '      </button>' +
        '     </div>' +
        '     <div class="clearfix colelem" id="pu988"><!-- group -->' +
        '      <div class="grpelem" id="u988"><i class="fas fa-user-friends fa-xs"></i><!-- simple frame --></div>' +
        '      <div class="clearfix grpelem" id="u987-4"><!-- content -->' +
        '       <p>' + info.online + '</p>' +
        '      </div>' +
        '     </div>' +
        '    </div>';



    $("#pu951").append(jobPanel);

}

window.addEventListener('message', function(event) {

    var edata = event.data;

    if (edata.type == "open") {

        job = edata.job.job;
        grade = edata.job.grade;
        offduty = edata.offduty;

        openJobManagement();
        //openJobCenter();


        const yourjobs = JSON.parse(edata.jobs);


        for (i = 0; i < yourjobs.length; i++) {
            addJob(yourjobs[i]);
        }




    }

    $(".addjob").click(function() {
        playClickSound();
        $(this).text('ADDED');
    });

    $(".select").click(function() {

        playClickSound();


        if ($(this).hasClass('offduty')) {

            if (offduty) {
                $(document).find(".select").text('SELECT');
                $(this).text('SELECTED');
                $(document).find(".removebutton").removeClass('hidden')
                $.post('https://brp_multijob/changejob', JSON.stringify({
                    job: this.dataset.job,
                    grade: this.dataset.grade
                }));
            } else {
                $.post('https://brp_multijob/cantoffduty', JSON.stringify({}));
            }
        } else {
            $(document).find(".select").text('SELECT');
            $(this).text('SELECTED');

            $(document).find(".removebutton").removeClass('hidden')
            $(this).parent().find(".removebutton").addClass('hidden');
            $.post('https://brp_multijob/changejob', JSON.stringify({
                job: this.dataset.job,
                grade: this.dataset.grade
            }));
        }


    });


    $(".removebutton").click(function() {
        playClickSound();
        $(this).parent().parent().fadeOut();
        $.post('https://brp_multijob/removejob', JSON.stringify({
            job: this.dataset.job,
            grade: this.dataset.grade
        }));
    });


});