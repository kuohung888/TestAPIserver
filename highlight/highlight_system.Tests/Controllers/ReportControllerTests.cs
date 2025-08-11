using Microsoft.VisualStudio.TestTools.UnitTesting;
using highlight_system.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace highlight_system.Controllers.Tests
{
    [TestClass()]
    public class ReportControllerTests
    {
        [TestMethod()]
        public void IndexTest()
        {
            // Arrange
            ReportController controller = new ReportController();

            // Act
            ViewResult result = controller.Index() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void AnalysisReportTest()
        {
            // Arrange
            ReportController controller = new ReportController();

            // Act
            ViewResult result = controller.AnalysisReport() as ViewResult;

            // Assert
            Assert.AreEqual("Your analysis report page.", result.ViewBag.Message);
        }

        [TestMethod()]
        public void AnalysisReportTest1()
        {
            // Arrange
            ReportController controller = new ReportController();

            // Act
            ViewResult result = controller.AnalysisReport() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void JinMianReportTest()
        {
            // Arrange
            ReportController controller = new ReportController();

            // Act
            ViewResult result = controller.JinMianReport() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void JinMianReportTest1()
        {
            // Arrange
            ReportController controller = new ReportController();

            // Act
            ViewResult result = controller.JinMianReport() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void DimpleReportTest()
        {
            // Arrange
            ReportController controller = new ReportController();

            // Act
            ViewResult result = controller.DimpleReport() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void DimpleReportTest1()
        {
            // Arrange
            ReportController controller = new ReportController();

            // Act
            ViewResult result = controller.DimpleReport() as ViewResult;

            // Assert
            Assert.IsNotNull(result);
        }

        [TestMethod()]
        public void CommonDefect_ExportExcelTest()
        {

        }

        [TestMethod()]
        public void JinMian_ExportExcelTest()
        {

        }

        [TestMethod()]
        public void Dimple_ExportExcelTest()
        {

        }

        [TestMethod()]
        public void Item_DownloadTest()
        {

        }
    }
}