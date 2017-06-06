/**
 * Created by LuWenjing on 2017/6/6.
 */
function showChart(){
    var ctx = document.getElementById("canvas").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["submit-failed", "pending", "judging", "accepted", "ComplieError", "RuntimeError"],
            datasets: [{
                label: '# of Votes',
                data: [12, 8, 3, 5, 2, 3],
                backgroundColor: [
                    '#BE3144',
                    '#bbb',
                    '#4797B1',
                    'rgb(39, 194, 76)',
                    '#FC8A15',
                    '#FF847C'
                ],
                borderWidth: 1
            }]
        },
        options: {

        }
    });

}